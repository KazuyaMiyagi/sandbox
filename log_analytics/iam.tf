resource "aws_iam_role" "storage_transfer_service" {
  name = "storage-transfer-service-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Principal" : {
          "Federated" : "accounts.google.com"
        },
        "Condition" : {
          "StringEquals" : {
            "accounts.google.com:aud" : [
              data.google_storage_transfer_project_service_account.default.subject_id
            ]
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "storage_transfer_service" {
  name = "storage-transfer-service-policy"

  # trivy:ignore:AVD-AWS-0057
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:GetObjectVersion",
        ],
        "Resource" : [
          "${module.s3_bucket_cloudfront_logs.s3_bucket_arn}/*",
          module.s3_bucket_cloudfront_logs.s3_bucket_arn,
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : "kms:Decrypt",
        "Resource" : module.aws_kms.key_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "storage_transfer_service" {
  role       = aws_iam_role.storage_transfer_service.name
  policy_arn = aws_iam_policy.storage_transfer_service.arn
}
