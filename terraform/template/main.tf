terraform {
  required_version = "1.16.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.68.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.6.0"
    }
  }
}
