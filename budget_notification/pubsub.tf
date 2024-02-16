resource "google_pubsub_topic" "main" {
  project = data.google_project.current.project_id
  name    = "${var.app_name}-topic"
}

resource "google_pubsub_topic_iam_policy" "main" {
  project = data.google_project.current.project_id
  topic   = google_pubsub_topic.main.name
  policy_data = jsonencode(
    {
      bindings = [
        {
          role = "roles/pubsub.publisher",
          members = [
            "serviceAccount:billing-budget-alert@system.gserviceaccount.com",
          ]
        },
      ]
    }
  )
}
