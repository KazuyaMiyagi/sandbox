locals {
  lightsail_account_id = split("/", data.external.lightsail_support_code.result.support_code)[0]
  instance_id          = split("/", data.external.lightsail_support_code.result.support_code)[1]
}

resource "aws_iam_role" "lightsail_role_for" {
  name = "LightsailRoleFor-${local.instance_id}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:sts::${local.lightsail_account_id}:assumed-role/AmazonLightsailInstance/${local.instance_id}"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policies_exclusive" "lightsail_role_for" {
  role_name    = aws_iam_role.lightsail_role_for.name
  policy_names = []
}

resource "aws_iam_role_policy_attachments_exclusive" "lightsail_role_for" {
  role_name = aws_iam_role.lightsail_role_for.name
  policy_arns = [
    aws_iam_policy.lightsail_role_for.arn,
  ]
}

resource "aws_iam_policy" "lightsail_role_for" {
  name = "LightsailRoleFor-${local.instance_id}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "BedrockInvoke"
        Effect = "Allow"
        Action = [
          "bedrock:ListFoundationModels",
          "bedrock:InvokeModel",
          "bedrock:InvokeModelWithResponseStream",
        ]
        Resource = "*"
      },
      {
        Sid    = "MarketplaceModelAccess"
        Effect = "Allow"
        Action = [
          "aws-marketplace:Subscribe",
          "aws-marketplace:Unsubscribe",
          "aws-marketplace:ViewSubscriptions",
        ]
        Resource = "*"
      }
    ]
  })
}
