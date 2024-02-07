resource "google_project_iam_member" "main" {
  count   = local.create_google_resources ? 1 : 0
  project = data.google_project.current.project_id
  role    = "roles/viewer"

  member = "serviceAccount:${google_service_account.main[count.index].email}"
}
