terraform {
  required_version = "1.14.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.19.0"
    }
  }
}
