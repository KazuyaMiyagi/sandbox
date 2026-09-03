terraform {
  required_version = "1.16.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.46.0"
    }
  }
}
