terraform {
  required_version = "1.15.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.47.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.4.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.0"
    }
  }
}
