locals {
  # https://cloud.google.com/datastream/docs/ip-allowlists-and-regions?hl=ja
  google_cloud_datastream_asia_northeast1_cidrs = [
    "34.146.175.7/32",
    "34.146.177.122/32",
    "35.194.107.163/32",
    "35.189.147.253/32",
    "34.84.33.5/32",
  ]
}

resource "aws_security_group" "datastream_bastion" {
  name        = "datastream-bastion"
  description = "Datastream Bastion"

  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = random_integer.ephemeral_port.result
    to_port     = random_integer.ephemeral_port.result
    protocol    = "tcp"
    description = "Google Datastream connection over ssh"
    cidr_blocks = concat(
      [var.my_ip_cidr],
      local.google_cloud_datastream_asia_northeast1_cidrs
    )
  }

  # trivy:ignore:AVD-AWS-0124
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # trivy:ignore:AVD-AWS-0104
    cidr_blocks = ["0.0.0.0/0"]
  }
}
