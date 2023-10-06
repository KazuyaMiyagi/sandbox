# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.6.0"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.20.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.84.0"
    }
  }
}
