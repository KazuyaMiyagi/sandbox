# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.6.2"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.4.0"
    }
  }
}
