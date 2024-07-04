# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.9.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}
