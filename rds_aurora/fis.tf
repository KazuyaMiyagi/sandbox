resource "aws_fis_experiment_template" "failover" {
  description = "Failover RDS cluster"

  role_arn = aws_iam_role.fis.arn

  action {
    action_id   = "aws:rds:failover-db-cluster"
    name        = "rds-failover"
    start_after = []
    target {
      key   = "Clusters"
      value = "Clusters-Target-1"
    }
  }

  target {
    name          = "Clusters-Target-1"
    resource_type = "aws:rds:cluster"
    resource_arns = [
      module.aurora_mysql57.cluster_arn
    ]
    selection_mode = "ALL"
  }

  stop_condition {
    source = "none"
    value  = null
  }

  log_configuration {
    log_schema_version = 2
    cloudwatch_logs_configuration {
      log_group_arn = "${aws_cloudwatch_log_group.fis.arn}:*"
    }
  }

  tags = {
    Name = "Failover RDS cluster"
  }
}

resource "aws_fis_experiment_template" "reboot" {
  description = "Reboot RDS instances"

  role_arn = aws_iam_role.fis.arn

  action {
    action_id   = "aws:rds:reboot-db-instances"
    name        = "rds-reboot"
    start_after = []
    target {
      key   = "DBInstances"
      value = "DBInstances-Target-1"
    }
  }

  target {
    name          = "DBInstances-Target-1"
    resource_type = "aws:rds:db"
    resource_arns = [
      for instance in module.aurora_mysql57.cluster_instances : instance.arn
    ]
    selection_mode = "ALL"
  }

  stop_condition {
    source = "none"
    value  = null
  }

  log_configuration {
    log_schema_version = 2
    cloudwatch_logs_configuration {
      log_group_arn = "${aws_cloudwatch_log_group.fis.arn}:*"
    }
  }

  tags = {
    Name = "Reboot RDS instances"
  }
}
