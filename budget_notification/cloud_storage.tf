# trivy:ignore:AVD-GCP-0066
resource "google_storage_bucket" "source" {
  project                     = data.google_project.current.project_id
  name                        = var.app_name
  location                    = "asia-northeast1"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  # sandbox only settings
  force_destroy = true
}

resource "google_storage_bucket_object" "functions_zip" {
  name   = "functions.zip"
  bucket = google_storage_bucket.source.name
  source = data.archive_file.source.output_path
}

