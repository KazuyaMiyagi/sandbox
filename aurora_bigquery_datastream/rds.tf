module "aurora_mysql57" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "9.3.0"

  name           = "sandbox-mysql57"
  engine         = "aurora-mysql"
  engine_version = "5.7.mysql_aurora.2.11.4"
  instance_class = "db.t3.small"
  instances = {
    1 = {}
    2 = {}
  }

  vpc_id = data.aws_vpc.default.id

  create_db_subnet_group = true
  subnets                = data.aws_subnets.default.ids

  security_group_rules = {
    ex1_ingress = {
      cidr_blocks = [
        for subnet in data.aws_subnet.default : subnet.cidr_block
      ]
    }
    ex2_ingress = {
      source_security_group_id = aws_security_group.datastream_bastion.id
    }
    # sandbox only settings
    ex3_ingress = {
      cidr_blocks = [var.my_ip_cidr]
    }
  }

  master_username = "admin"
  master_password = "secret"

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  create_db_cluster_parameter_group = true
  db_cluster_parameter_group_family = "aurora-mysql5.7"
  db_cluster_parameter_group_parameters = [
    {
      name         = "binlog_format"
      value        = "ROW"
      apply_method = "pending-reboot"
    },
    {
      name         = "gtid-mode"
      value        = "ON"
      apply_method = "pending-reboot"
    },
    {
      name         = "binlog_gtid_simple_recovery"
      value        = "1"
      apply_method = "pending-reboot"
    },
    {
      name         = "enforce_gtid_consistency"
      value        = "ON"
      apply_method = "pending-reboot"
    },
  ]

  create_db_parameter_group     = true
  db_parameter_group_family     = "aurora-mysql5.7"
  db_parameter_group_parameters = []

  enabled_cloudwatch_logs_exports = [
    "audit",
    "error",
    "general",
    "slowquery",
  ]

  ca_cert_identifier = "rds-ca-ecc384-g1"

  # sandbox only settings
  skip_final_snapshot = true
  deletion_protection = false
  publicly_accessible = true
}
