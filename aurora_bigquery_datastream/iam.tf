resource "aws_iam_role" "fis" {
  name = "SandboxFISExecutionRole"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sts:AssumeRole"
        "Principal" : {
          "Service" : "fis.amazonaws.com"
        }
      }
    ]
  })

  managed_policy_arns = [
    data.aws_iam_policy.aws_fault_injection_simulator_rds_access.arn,
    aws_iam_policy.fis.arn,
  ]
}

resource "aws_iam_policy" "fis" {
  name = "SandboxFISPolicy"

  # trivy:ignore:AVD-AWS-0057
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogDelivery"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:PutResourcePolicy",
          "logs:DescribeResourcePolicies",
          "logs:DescribeLogGroups"
        ],
        "Resource" : "*"
      }
    ]
  })
}
