# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.10.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.20.0"
    }
  }
}
