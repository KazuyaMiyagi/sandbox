# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.10.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.15.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}
