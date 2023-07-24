output "aws_route53_zone_main" {
  description = "The main Route53 zone"
  value       = aws_route53_zone.main
}

output "aws_acm_certificate_main" {
  description = "The main ACM certificate"
  value       = aws_acm_certificate.main
  sensitive   = true
}

output "aws_acm_certificate_cloudfront" {
  description = "The CloudFront ACM certificate"
  value       = aws_acm_certificate.cloudfront
  sensitive   = true
}
