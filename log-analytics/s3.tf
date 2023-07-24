# tfsec:ignore:aws-s3-enable-bucket-logging
module "s3_bucket_cloudfront_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.14.1"

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
        kms_master_key_id = module.kms_main.key_arn
      }
    }
  }

  versioning = {
    enabled = true
  }
}
