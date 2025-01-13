module "s3_bucket_tfstate" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.4.0"

  bucket = "${data.aws_caller_identity.current.id}-tfstate"

  block_public_acls = true

  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = module.kms_main.key_arn
      }
    }
  }

  versioning = {
    enabled = true
  }

  logging = {
    target_bucket = module.s3_bucket_tfstate_logs.s3_bucket_id
    target_prefix = "/"
  }

  lifecycle_rule = [
    {
      id     = "rule1"
      status = "Enabled"
      noncurrent_version_expiration = {
        noncurrent_days = 7
      }
      abort_incomplete_multipart_upload_days = 1
    },
    {
      id     = "rule2"
      status = "Enabled"
      expiration = {
        days                         = 0
        expired_object_delete_marker = true
      }
    }
  ]
}

module "s3_bucket_tfstate_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.4.0"

  bucket = "${data.aws_caller_identity.current.id}-tfstate-logs"

  block_public_acls = true

  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = module.kms_main.key_arn
      }
    }
  }

  versioning = {
    enabled = true
  }

  lifecycle_rule = [
    {
      id     = "rule1"
      status = "Enabled"
      expiration = {
        days = 7
      }
      noncurrent_version_expiration = {
        noncurrent_days = 7
      }
      abort_incomplete_multipart_upload_days = 1
    },
    {
      id     = "rule2"
      status = "Enabled"
      expiration = {
        days                         = 0
        expired_object_delete_marker = true
      }
    }
  ]
}

module "s3_bucket_athena_query_results" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.4.0"

  bucket = "aws-athena-query-results-${data.aws_caller_identity.current.id}-${data.aws_region.current.name}"

  block_public_acls = true

  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = module.kms_main.key_arn
      }
    }
  }

  versioning = {
    enabled = true
  }

  lifecycle_rule = [
    {
      id     = "rule1"
      status = "Enabled"
      expiration = {
        days = 7
      }
      noncurrent_version_expiration = {
        noncurrent_days = 7
      }
      abort_incomplete_multipart_upload_days = 1
    },
    {
      id     = "rule2"
      status = "Enabled"
      expiration = {
        days                         = 0
        expired_object_delete_marker = true
      }
    }
  ]
}
