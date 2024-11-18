module "lambda_main" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.15.0"

  function_name = "CloudFrontAccessLogsPartitioner"
  handler       = "moveAccessLogs.handler"
  runtime       = "nodejs18.x"

  environment_variables = {
    TARGET_KEY_PREFIX = "partitioned/"
  }

  # https://github.com/aws-samples/amazon-cloudfront-access-logs-queries/blob/84d8c5be7ae87fb144ca6f1ca02d5b803e754a75/functions/moveAccessLogs.js
  local_existing_package = data.archive_file.move_access_logs.output_path
  create_package         = false

  attach_tracing_policy = true
  tracing_mode          = "Active"

  attach_policy_json = true
  policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
        ]
        Effect = "Allow"
        Resource = [
          "${module.s3_bucket_cloudfront_logs.s3_bucket_arn}/partitioned/*",
        ]
      },
      {
        Action = [
          "s3:GetObject",
          "s3:DeleteObject",
        ]
        Effect = "Allow"
        Resource = [
          "${module.s3_bucket_cloudfront_logs.s3_bucket_arn}/raw/*",
        ]
      },
      {
        Action = [
          "kms:GenerateDataKey",
          "kms:Decrypt",
        ]
        Effect   = "Allow"
        Resource = module.aws_kms.key_arn
      },
    ]

  })
}
