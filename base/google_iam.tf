resource "google_project_iam_member" "main" {
  project = data.google_project.current.project_id
  role    = "roles/viewer"

  member = "serviceAccount:${google_service_account.main.email}"
}
