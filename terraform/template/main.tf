terraform {
  required_version = "1.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.12.0"
    }
  }
}
