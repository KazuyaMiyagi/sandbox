# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.5.7"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.82.0"
    }
  }
}
