terraform {
  required_version = "1.15.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.50.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.36.0"
    }
  }
}
