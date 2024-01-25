locals {
  default_tags = {
    managedby   = "terraform"
    environment = "sandbox"
    sourcerepo  = "kazuyamiyagi_sandbox"
    sourcedir   = "template"
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
