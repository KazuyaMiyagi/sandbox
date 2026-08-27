terraform {
  required_version = "1.16.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.61.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.4.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.6.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.0"
    }
  }
}
