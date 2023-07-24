resource "aws_route53_record" "cdn" {
  zone_id = data.terraform_remote_state.base.outputs.aws_route53_zone_main.zone_id
  name    = "cdn.${data.terraform_remote_state.base.outputs.aws_route53_zone_main.name}"
  type    = "A"

  alias {
    zone_id                = module.cloudfront_main.cloudfront_distribution_hosted_zone_id
    name                   = module.cloudfront_main.cloudfront_distribution_domain_name
    evaluate_target_health = true
  }
}
