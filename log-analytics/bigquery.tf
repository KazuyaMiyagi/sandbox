module "bigquery" {
  source  = "terraform-google-modules/bigquery/google"
  version = "6.1.1"

  project_id = var.gcp_project_id
  location   = "asia-northeast1"

  dataset_id = "${replace(var.gcp_project_id, "-", "_")}_sandbox"
}
