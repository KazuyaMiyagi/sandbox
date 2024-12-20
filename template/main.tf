# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.10.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.14.1"
    }
  }
}
