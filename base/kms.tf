module "kms_main" {
  source  = "terraform-aws-modules/kms/aws"
  version = "2.1.0"

  enable_key_rotation = true
}
