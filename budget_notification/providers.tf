locals {
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "Sandbox"
    SourceRepo  = "KazuyaMiyagi/sandbox"
    SourceDir   = "budget_notification"
  }
  default_labels = { for k, v in local.default_tags : lower(k) => lower(replace(v, "/", "_")) }
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
  default_labels = local.default_labels
}
