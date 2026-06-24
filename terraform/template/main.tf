terraform {
  required_version = "1.15.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.52.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.38.0"
    }
  }
}
