terraform {
  required_version = "1.12.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.48.0"
    }
  }
}
