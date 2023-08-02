locals {
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "Sandbox"
    SourceRepo  = "KazuyaMiyagi/sandbox"
    SourceDir   = "log-analytics"
  }
}

provider "archive" {}

provider "aws" {
  region = "ap-northeast-1"
  alias  = "tokyo"
  default_tags {
    tags = local.default_tags
  }
}

provider "google" {}
