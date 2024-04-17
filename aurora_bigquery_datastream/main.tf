# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.8.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}
