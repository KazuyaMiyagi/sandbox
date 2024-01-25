resource "google_service_account" "main" {
  project      = data.google_project.current.project_id
  account_id   = var.app_name
  display_name = "${title(var.app_name)} Service Account"
}
