# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
# account data
data "aws_caller_identity" "current" {}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region
# region data
data "aws_region" "current" {}

# https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http
data "http" "github_keys" {
  url = "https://github.com/KazuyaMiyagi.keys"
}

# https://checkip.amazonaws.com
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

# https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external
data "external" "lightsail_support_code" {
  program = ["bash", "-c", "aws lightsail get-instance --instance-name ${aws_lightsail_instance.main.name} --region ap-northeast-1 --query '{support_code: instance.supportCode}' --output json"]
  depends_on = [
    aws_lightsail_instance.main,
  ]
}
