resource "google_datastream_connection_profile" "source_aurora_mysql" {
  project = data.google_project.current.project_id

  connection_profile_id = "source-aurora-mysql"
  display_name          = "Source Aurora MySQL"
  location              = "asia-northeast1"

  mysql_profile {
    hostname = module.aurora_mysql57.cluster_endpoint
    port     = module.aurora_mysql57.cluster_port
    username = jsondecode(data.aws_secretsmanager_secret_version.rds_master_user_password.secret_string).username
    password = jsondecode(data.aws_secretsmanager_secret_version.rds_master_user_password.secret_string).password
  }

  forward_ssh_connectivity {
    hostname    = aws_route53_record.datastream_bastion.fqdn
    username    = "datastream"
    port        = random_integer.ephemeral_port.result
    private_key = tls_private_key.datastream.private_key_openssh
  }
}

resource "google_datastream_connection_profile" "destination_bigquery" {
  project = data.google_project.current.project_id

  connection_profile_id = "destination-bigquery"
  display_name          = "Destination BigQuery"
  location              = "asia-northeast1"
  bigquery_profile {}
}

resource "google_datastream_stream" "main" {
  project = data.google_project.current.project_id

  stream_id    = "amazon-aurora-mysql-to-bigquery"
  display_name = "Amazon Aurora MySQL to BigQuery"
  location     = "asia-northeast1"

  desired_state = "RUNNING"

  backfill_all {
  }

  source_config {
    source_connection_profile = google_datastream_connection_profile.source_aurora_mysql.id
    mysql_source_config {
      max_concurrent_backfill_tasks = 0
      max_concurrent_cdc_tasks      = 0
    }
  }

  destination_config {
    destination_connection_profile = google_datastream_connection_profile.destination_bigquery.id
    bigquery_destination_config {
      data_freshness = "900s"
      single_target_dataset {
        dataset_id = module.bigquery_datastream.bigquery_dataset.id
      }
    }
  }
}
