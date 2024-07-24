# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}
