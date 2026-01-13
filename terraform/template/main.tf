terraform {
  required_version = "1.14.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.16.0"
    }
  }
}
