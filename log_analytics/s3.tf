module "s3_bucket_cloudfront_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.4.0"

  bucket = "${data.aws_caller_identity.current.id}-cloudfront-logs"

  block_public_acls = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  grant = [
    {
      type       = "CanonicalUser"
      permission = "FULL_CONTROL"
      id         = data.aws_canonical_user_id.current.id
    },
    {
      type       = "CanonicalUser"
      permission = "FULL_CONTROL"
      id         = data.aws_cloudfront_log_delivery_canonical_user_id.cloudfront.id
    }
  ]

  owner = {
    id = data.aws_canonical_user_id.current.id
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = module.aws_kms.key_arn
      }
    }
  }

  versioning = {
    enabled = true
  }
}

module "s3_bucket_notification_cloudfront_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws//modules/notification"
  version = "4.4.0"

  bucket = module.s3_bucket_cloudfront_logs.s3_bucket_id

  lambda_notifications = {
    cloudfront_accesslogs_partitioner = {
      function_arn  = module.lambda_main.lambda_function_arn
      function_name = module.lambda_main.lambda_function_name
      events        = ["s3:ObjectCreated:Put"]
      filter_prefix = "raw/"
      filter_suffix = null
    }
  }
}
