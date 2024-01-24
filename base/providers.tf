locals {
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "Sandbox"
    SourceRepo  = "KazuyaMiyagi/sandbox"
    SourceDir   = "base"
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
  default_tags {
    tags = local.default_tags
  }
}

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
