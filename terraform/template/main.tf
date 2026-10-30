terraform {
  required_version = "1.17.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "8.8.0"
    }
  }
}
