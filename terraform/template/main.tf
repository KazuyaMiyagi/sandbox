terraform {
  required_version = "1.12.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.39.0"
    }
  }
}
