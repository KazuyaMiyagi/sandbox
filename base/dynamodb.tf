resource "aws_dynamodb_table" "tfstate" {
  name = "${data.aws_caller_identity.current.id}-tfstate"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  deletion_protection_enabled = true

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = module.kms_main.key_arn
  }

  attribute {
    name = "LockID"
    type = "S"
  }
}
