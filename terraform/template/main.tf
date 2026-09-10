terraform {
  required_version = "1.16.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.1.0"
    }
  }
}
