# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.9.5"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.2.0"
    }
  }
}
