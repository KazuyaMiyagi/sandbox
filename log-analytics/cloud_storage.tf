# tfsec:ignore:google-storage-bucket-encryption-customer-key
module "cloud_storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "4.0.0"

  project_id = data.google_project.current.project_id
  location   = "asia-northeast1"

  names = [
    "${data.google_project.current.number}-sandbox",
  ]
}

resource "google_storage_bucket_iam_member" "storage_transfer_service" {
  bucket = module.cloud_storage.bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
}

resource "google_storage_transfer_job" "cloudfront_log" {
  project     = data.google_project.current.project_id
  description = "CloudFront log transfer job"

  transfer_spec {
    aws_s3_data_source {
      bucket_name = module.s3_bucket_cloudfront_logs.s3_bucket_id
      role_arn    = aws_iam_role.storage_transfer_service.arn
      path        = "partitioned/"
    }
    gcs_data_sink {
      bucket_name = module.cloud_storage.bucket.name
    }
  }

  schedule {
    schedule_start_date {
      year  = 2023
      month = 7
      day   = 1
    }
    repeat_interval = "3600s"
  }
}
