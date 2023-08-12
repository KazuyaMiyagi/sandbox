locals {
  repo = "KazuyaMiyagi/sandbox"
}

variable "domain_name" {
  description = "The domain name to use for the Route53 zone"
  type        = string
}
