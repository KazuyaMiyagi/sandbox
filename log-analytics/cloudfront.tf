module "cloudfront_main" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "3.2.1"

  aliases = ["cdn.${data.terraform_remote_state.base.outputs.aws_route53_zone_main.name}"]

  enabled = true

  http_version = "http2and3"

  logging_config = {
    bucket          = module.s3_bucket_cloudfront_logs.s3_bucket_bucket_domain_name
    prefix          = "raw/"
    include_cookies = true
  }

  origin = {
    something = {
      domain_name = "example.com"
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      }
    }
  }

  default_cache_behavior = {
    target_origin_id       = "something"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

  viewer_certificate = {
    acm_certificate_arn      = data.terraform_remote_state.base.outputs.aws_acm_certificate_cloudfront.arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}
