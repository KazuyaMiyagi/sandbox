variable "my_ip_cidr" {
  description = "My IP cidr"
  type        = string
}

variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "domain_name" {
  description = "The domain name to use for the Route53 zone"
  type        = string
}
