module "gcp_gh_oidc" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "3.1.2"

  project_id  = data.google_project.current.project_id
  pool_id     = "sandbox-github-actions-pool"
  provider_id = "sandbox-github-actions-provider"
  sa_mapping = {
    # tflint-ignore: terraform_deprecated_interpolation
    "${google_service_account.main.account_id}" = {
      sa_name   = google_service_account.main.name
      attribute = "attribute.repository/${local.repo}"
    }
  }
}

resource "google_service_account" "main" {
  project    = data.google_project.current.project_id
  account_id = "sandbox-github-actions"
}

resource "google_service_account_iam_policy" "main" {
  service_account_id = google_service_account.main.name
  policy_data = jsonencode({
    "bindings" : [
      {
        "role" : "roles/iam.workloadIdentityUser",
        "members" : [
          format(
            "principalSet://iam.googleapis.com/%s/attribute.repository/%s",
            module.gcp_gh_oidc.pool_name,
            local.repo,
          )
        ],
      }
    ]
  })
}
