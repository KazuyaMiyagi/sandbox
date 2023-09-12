# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
# account data
data "aws_caller_identity" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region
# region data
data "aws_region" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy
data "aws_iam_policy" "administrator_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project.html
data "google_project" "current" {
  project_id = var.gcp_project_id
}

# https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http
data "http" "github_actions" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

# https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate
data "tls_certificate" "github_actions" {
  url = jsondecode(data.http.github_actions.response_body).jwks_uri
}
