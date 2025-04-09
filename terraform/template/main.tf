# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.11.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.29.0"
    }
  }
}
