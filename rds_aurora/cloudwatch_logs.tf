resource "aws_cloudwatch_log_group" "fis" {
  name              = "/aws/fis"
  retention_in_days = 14
}
