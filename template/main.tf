# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.35.0"
    }
  }
}
