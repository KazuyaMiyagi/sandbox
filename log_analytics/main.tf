# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.10.2"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.7.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
  }
}
