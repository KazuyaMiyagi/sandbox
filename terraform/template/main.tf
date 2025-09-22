terraform {
  required_version = "1.13.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.3.0"
    }
  }
}
