module "bigquery_datastream" {
  source  = "terraform-google-modules/bigquery/google"
  version = "7.0.0"

  project_id = data.google_project.current.project_id
  location   = "asia-northeast1"

  dataset_id = "miyagi_sandbox_datastream"

  # sandbox only settings
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset_iam_policy" "datastream" {
  project    = data.google_project.current.project_id
  dataset_id = module.bigquery_datastream.bigquery_dataset.dataset_id
  policy_data = jsonencode({
    bindings = [
      {
        "role" : "roles/bigquery.dataOwner",
        "members" : [
          "projectOwners",
        ],
      }
    ]
  })
}
