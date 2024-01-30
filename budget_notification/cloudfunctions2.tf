resource "google_cloudfunctions2_function" "budget_notification" {
  project  = data.google_project.current.project_id
  name     = var.app_name
  location = "asia-northeast1"

  build_config {
    runtime     = "python312"
    entry_point = "subscribe"
    environment_variables = {
      # SEE: https://github.com/hashicorp/terraform-provider-google/issues/1938#issuecomment-1576849526
      # ソースを更新しても更新されないので、SHAを指定し差分を検知させる
      SOURCE_SHA = data.archive_file.source.output_sha
    }
    docker_repository = format(
      "projects/%s/locations/%s/repositories/%s",
      data.google_artifact_registry_repository.gcf_artifacts.project,
      data.google_artifact_registry_repository.gcf_artifacts.location,
      data.google_artifact_registry_repository.gcf_artifacts.repository_id,
    )
    source {
      storage_source {
        bucket = google_storage_bucket.source.name
        object = google_storage_bucket_object.functions_zip.name
      }
    }
  }

  service_config {
    max_instance_count               = 1
    min_instance_count               = 1
    available_memory                 = "256Mi"
    timeout_seconds                  = 60
    max_instance_request_concurrency = 1
    available_cpu                    = "83m"
    environment_variables = {
      SLACK_CHANNEL     = var.slack_channel
      NOTIFY_TIME_RANGE = "15-16"
    }
    secret_environment_variables {
      key        = "SLACK_WEBHOOK_URL"
      project_id = data.google_project.current.project_id
      secret     = google_secret_manager_secret.secret.secret_id
      version    = "latest"
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = google_service_account.main.email
  }

  event_trigger {
    trigger_region = "asia-northeast1"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = google_pubsub_topic.main.id
    retry_policy   = "RETRY_POLICY_RETRY"
  }
}
