"""
参考: https://cloud.google.com/billing/docs/how-to/notify?hl=ja

サンプルペイロード
{
    "budgetDisplayName": "name-of-budget",
    "alertThresholdExceeded": 1.0,
    "costAmount": 100.01,
    "costIntervalStart": "2019-01-01T00:00:00Z",
    "budgetAmount": 100.00,
    "budgetAmountType": "SPECIFIED_AMOUNT",
    "currencyCode": "USD"
}
"""
import base64
import json
import logging
import os
import traceback
import urllib.request
from datetime import UTC, datetime

import functions_framework
from cloudevents.http import CloudEvent

webhook_url = os.environ["SLACK_WEBHOOK_URL"]
channel = os.environ["SLACK_CHANNEL"]
# 通知時間帯 (UTC), フォーマット: %H:%M:%S-%H:%M:%S, 例: 15:00:00-15:30:00
# 約30分に一度メッセージがパブリッシュされる
time_range = os.getenv("NOTIFY_TIME_RANGE", "15:00:00-15:30:00").split("-")
logger = logging.getLogger()


@functions_framework.cloud_event
def subscribe(cloud_event: CloudEvent) -> None:
    try:
        utc_time = datetime.now(UTC).time()
        start_time = datetime.strptime(time_range[0], "%H:%M:%S").time()
        end_time = datetime.strptime(time_range[1], "%H:%M:%S").time()

        if start_time <= utc_time <= end_time:
            payload = json.loads(
                base64.b64decode(cloud_event.data["message"]["data"]).decode()
            )
            data = {
                "channel": channel,
                "blocks": [
                    {
                        "type": "header",
                        "text": {
                            "type": "plain_text",
                            "text": payload.get("budgetDisplayName"),
                        },
                    },
                    {
                        "type": "section",
                        "fields": [
                            {
                                "type": "mrkdwn",
                                "text": "*AlertThresholdExceeded:*\n{}".format(
                                    payload.get("alertThresholdExceeded")
                                ),
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*CostAmount:*\n{}".format(
                                    payload.get("costAmount")
                                ),
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*CostIntervalStart:*\n{}".format(
                                    payload.get("costIntervalStart")
                                ),
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*BudgetAmount:*\n{}".format(
                                    payload.get("budgetAmount")
                                ),
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*BudgetAmounType:*\n{}".format(
                                    payload.get("budgetAmounType")
                                ),
                            },
                            {
                                "type": "mrkdwn",
                                "text": "*CurrencyCode:*\n{}".format(
                                    payload.get("currencyCode")
                                ),
                            },
                        ],
                    },
                ],
            }
            headers = {"Content-Type": "application/json"}
            req = urllib.request.Request(
                method="POST",
                url=webhook_url,
                data=json.dumps(data).encode(),
                headers=headers,
            )
            urllib.request.urlopen(req)

    except Exception:
        logger.error({"cloud_event": cloud_event, "traceback": traceback.format_exc()})
