# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.11.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.90.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.24.0"
    }
  }
}
