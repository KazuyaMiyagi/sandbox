module "bigquery" {
  source  = "terraform-google-modules/bigquery/google"
  version = "8.1.0"

  project_id = data.google_project.current.project_id
  location   = "asia-northeast1"

  dataset_id = "${data.google_project.current.number}_sandbox"

  external_tables = [
    {
      table_id   = "CloudFront"
      autodetect = false
      schema     = file("./files/schema/CloudFront.json")

      expiration_time = "0"

      source_uris = [
        "${module.cloud_storage.bucket.url}/*"
      ]

      source_format         = "CSV"
      compression           = "GZIP"
      ignore_unknown_values = false
      max_bad_records       = 0

      csv_options = {
        encoding              = "UTF-8"
        allow_jagged_rows     = false
        allow_quoted_newlines = false
        field_delimiter       = "\t"
        quote                 = ""
        # 1 にするとヘッダが入ってしまう
        skip_leading_rows = 2
      }

      hive_partitioning_options = {
        mode              = "AUTO"
        source_uri_prefix = "${module.cloud_storage.bucket.url}/"
      }

      google_sheets_options = null
      labels                = null
    }
  ]
}
