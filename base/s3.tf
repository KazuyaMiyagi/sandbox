module "s3_bucket_tfstate" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.0"

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
}

# tfsec:ignore:aws-s3-enable-bucket-logging
module "s3_bucket_tfstate_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.0"

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
}

# tfsec:ignore:aws-s3-enable-bucket-logging
module "s3_bucket_athena_query_results" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.0"

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
}
