module "kms_main" {
  source  = "terraform-aws-modules/kms/aws"
  version = "2.2.0"

  aliases = [
    "base",
  ]

  enable_key_rotation = true
}
