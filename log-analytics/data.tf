# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id
data "aws_canonical_user_id" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_log_delivery_canonical_user_id
data "aws_cloudfront_log_delivery_canonical_user_id" "cloudfront" {}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_transfer_project_service_account
data "google_storage_transfer_project_service_account" "default" {
  project = var.gcp_project_id
}
