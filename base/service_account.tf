module "gcp_gh_oidc" {
  count = local.create_google_resources ? 1 : 0

  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "4.0.0"

  project_id          = data.google_project.current.project_id
  pool_id             = "sandbox-github-actions-pool"
  provider_id         = "sandbox-github-actions-provider"
  attribute_condition = "assertion.repository_owner=='KazuyaMiyagi'"
  sa_mapping = {
    # tflint-ignore: terraform_deprecated_interpolation
    "${google_service_account.main[count.index].account_id}" = {
      sa_name   = google_service_account.main[count.index].name
      attribute = "attribute.repository/${local.repo}"
    }
  }
}

resource "google_service_account" "main" {
  count = local.create_google_resources ? 1 : 0

  project    = data.google_project.current.project_id
  account_id = "sandbox-github-actions"
}

resource "google_service_account_iam_policy" "main" {
  count = local.create_google_resources ? 1 : 0

  service_account_id = google_service_account.main[count.index].name
  policy_data = jsonencode({
    "bindings" : [
      {
        "role" : "roles/iam.workloadIdentityUser",
        "members" : [
          format(
            "principalSet://iam.googleapis.com/%s/attribute.repository/%s",
            module.gcp_gh_oidc[count.index].pool_name,
            local.repo,
          )
        ],
      }
    ]
  })
}
