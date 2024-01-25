# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.7.0"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.13.0"
    }
  }
}
