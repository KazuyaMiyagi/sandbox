locals {
  repo = "KazuyaMiyagi/sandbox"
}

variable "domain_name" {
  description = "The domain name to use for the Route53 zone"
  type        = string
}

variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}
