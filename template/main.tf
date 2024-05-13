# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.29.0"
    }
  }
}
