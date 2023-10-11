# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.6.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.20.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.84.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}
