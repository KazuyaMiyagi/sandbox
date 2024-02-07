locals {
  repo = "KazuyaMiyagi/sandbox"

  # 普段は消しておく
  create_google_resources = false
}

variable "domain_name" {
  description = "The domain name to use for the Route53 zone"
  type        = string
}

variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}
