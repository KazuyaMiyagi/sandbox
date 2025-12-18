terraform {
  required_version = "1.14.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.14.1"
    }
  }
}
