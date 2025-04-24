terraform {
  required_version = "1.11.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.96.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.31.0"
    }
  }
}
