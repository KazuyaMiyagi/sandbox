# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }
}
