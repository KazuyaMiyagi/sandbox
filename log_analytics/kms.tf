module "aws_kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.0.0"

  enable_key_rotation = true

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Default",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.id}:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      },
      {
        "Sid" : "Allow CloudFront to use the key to deliver logs",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "delivery.logs.amazonaws.com"
        },
        "Action" : "kms:GenerateDataKey*",
        "Resource" : "*"
      }
    ]
  })
}
