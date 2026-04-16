terraform {
  required_version = "1.14.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.28.0"
    }
  }
}
