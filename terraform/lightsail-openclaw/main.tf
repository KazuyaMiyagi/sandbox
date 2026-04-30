terraform {
  required_version = "1.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.5"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}
