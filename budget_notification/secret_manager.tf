resource "google_secret_manager_secret" "secret" {
  project   = data.google_project.current.project_id
  secret_id = "${var.app_name}-slack-webhook-url"

  replication {
    user_managed {
      replicas {
        location = "asia-northeast1"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret" {
  secret = google_secret_manager_secret.secret.name

  secret_data = var.slack_webhook_url
  enabled     = true
}

resource "google_secret_manager_secret_iam_member" "main" {
  project   = google_secret_manager_secret.secret.project
  secret_id = google_secret_manager_secret.secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.main.email}"
}
