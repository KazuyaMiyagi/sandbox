# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.10.0"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.79.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
  }
}
