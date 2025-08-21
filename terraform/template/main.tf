terraform {
  required_version = "1.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.49.1"
    }
  }
}
