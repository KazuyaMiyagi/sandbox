terraform {
  required_version = "1.16.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.64.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.4.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.6.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.0"
    }
  }
}
