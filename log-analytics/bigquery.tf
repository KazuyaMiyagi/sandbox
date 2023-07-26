module "bigquery" {
  source  = "terraform-google-modules/bigquery/google"
  version = "6.1.1"

  project_id = data.google_project.current.project_id
  location   = "asia-northeast1"

  dataset_id = "${data.google_project.current.number}_sandbox"
}
