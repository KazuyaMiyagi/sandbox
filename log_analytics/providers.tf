locals {
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "Sandbox"
    SourceRepo  = "KazuyaMiyagi/sandbox"
    SourceDir   = "log_analytics"
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

provider "google" {
  default_labels = local.default_tags
}
