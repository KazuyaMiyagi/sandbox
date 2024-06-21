# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.8.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.34.0"
    }
  }
}
