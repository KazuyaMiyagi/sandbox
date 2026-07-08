terraform {
  required_version = "1.15.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.53.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.39.0"
    }
  }
}
