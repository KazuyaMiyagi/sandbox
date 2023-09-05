module "kms_main" {
  source  = "terraform-aws-modules/kms/aws"
  version = "2.0.0"

  enable_key_rotation = true
}
