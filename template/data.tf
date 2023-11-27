# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
# account data
data "aws_caller_identity" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region
# region data
data "aws_region" "current" {}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project.html
data "google_project" "current" {
  project_id = var.gcp_project_id
}
