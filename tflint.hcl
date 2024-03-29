plugin "terraform" {
  enabled = true
  version = "0.5.0"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  preset = "all"
}

plugin "aws" {
  enabled = true
  version = "0.28.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  deep_check = false
}

rule "aws_s3_bucket_name" {
  enabled = true
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  regex = "^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$"
}

plugin "google" {
  enabled = true
  version = "0.26.0"
  source = "github.com/terraform-linters/tflint-ruleset-google"
  deep_check = false
}
