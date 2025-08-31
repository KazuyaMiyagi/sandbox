terraform {
  required_version = "1.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.11.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.0.1"
    }
  }
}
