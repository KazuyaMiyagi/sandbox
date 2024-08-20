# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.9.5"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.42.0"
    }
  }
}
