terraform {
  required_version = "1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.12.0"
    }
  }
}
