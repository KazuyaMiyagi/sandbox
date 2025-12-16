terraform {
  required_version = "1.14.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.26.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.14.0"
    }
  }
}
