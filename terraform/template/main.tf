terraform {
  required_version = "1.15.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.58.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.44.0"
    }
  }
}
