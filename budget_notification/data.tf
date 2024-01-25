data "google_project" "current" {
  project_id = var.gcp_project_id
}

data "archive_file" "source" {
  type = "zip"

  dynamic "source" {
    for_each = fileset("files/cloud_functions/${var.app_name}", "**")

    content {
      filename = source.key
      content  = file("files/cloud_functions/${var.app_name}/${source.key}")
    }
  }

  output_path = "dest/cloud_functions/${var.app_name}/functions.zip"
}

data "google_artifact_registry_repository" "gcf_artifacts" {
  project       = data.google_project.current.project_id
  location      = "asia-northeast1"
  repository_id = "gcf-artifacts"
}
