terraform {
  required_version = "1.17.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.4.2"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.6.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.1"
    }
  }
}
