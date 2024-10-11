module "kms_main" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.1"

  aliases = [
    "base",
  ]

  enable_key_rotation = true
}
