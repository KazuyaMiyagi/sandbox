# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.9.1"
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.36.0"
    }
  }
}
