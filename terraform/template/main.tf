terraform {
  required_version = "1.15.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.51.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.38.0"
    }
  }
}
