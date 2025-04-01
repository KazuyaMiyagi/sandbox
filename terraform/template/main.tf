# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.11.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.28.0"
    }
  }
}
