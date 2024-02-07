resource "aws_route53_record" "datastream_bastion" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "datastream-bastion.${data.aws_route53_zone.main.name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.datastream_bastion.public_ip]
}
