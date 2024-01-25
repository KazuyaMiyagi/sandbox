resource "google_pubsub_topic" "main" {
  project = data.google_project.current.project_id
  name    = "${var.app_name}-topic"
}

