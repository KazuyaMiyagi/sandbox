resource "aws_cloudtrail_event_data_store" "main" {
  name                           = "main"
  multi_region_enabled           = true
  retention_period               = 365 * 1 # 1 year
  termination_protection_enabled = true
}
