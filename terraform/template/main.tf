terraform {
  required_version = "1.12.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.45.0"
    }
  }
}
