locals {
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "Sandbox"
    SourceRepo  = "KazuyaMiyagi/sandbox"
    SourceDir = format(
      "%s/%s",
      basename(dirname(path.cwd)),
      basename(path.cwd),
    )
  }
}

provider "external" {}

provider "aws" {
  allowed_account_ids = [var.aws_account_id]
  region              = "ap-northeast-1"
  default_tags {
    tags = local.default_tags
  }
}

provider "http" {}

provider "random" {}
