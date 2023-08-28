module "aurora_mysql57" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "8.3.1"

  name           = "sandbox-mysql57"
  engine         = "aurora-mysql"
  engine_version = "5.7.mysql_aurora.2.11.3"
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
  }

  master_username = "admin"
  master_password = "secret"

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  enabled_cloudwatch_logs_exports = [
    "audit",
    "error",
    "general",
    "slowquery",
  ]

  # sandbox only settings
  skip_final_snapshot = true
  deletion_protection = false
}
