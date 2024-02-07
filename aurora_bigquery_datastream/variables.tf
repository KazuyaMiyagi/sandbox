variable "my_ip_cidr" {
  description = "My IP cidr"
  type        = string
}

variable "datastream_public_key" {
  description = "datastream public key"
  type        = string
}

variable "domain_name" {
  description = "The domain name to use for the Route53 zone"
  type        = string
}
