module "kms_main" {
  source  = "terraform-aws-modules/kms/aws"
  version = "1.5.0"

  enable_key_rotation = true
}
