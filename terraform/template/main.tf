terraform {
  required_version = "1.15.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.30.0"
    }
  }
}
