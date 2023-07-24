# https://www.terraform.io/docs/providers/aws/d/caller_identity.html
# account data
data "aws_caller_identity" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region
# region data
data "aws_region" "current" {}
