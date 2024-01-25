variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "budget-notification"
}

variable "slack_webhook_url" {
  description = "Slack webhook URL"
  type        = string
}

variable "slack_channel" {
  description = "Slack channel"
  type        = string
}
