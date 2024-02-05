resource "aws_cloudwatch_log_group" "fis" {
  name              = "/aws/fis"
  retention_in_days = 14
  kms_key_id        = aws_kms_key.cloudwatch_logs.arn
}
