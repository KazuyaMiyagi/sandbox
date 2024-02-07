resource "aws_security_group" "datastream_bastion" {
  name   = "datastream-bastion"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = random_integer.ephemeral_port.result
    to_port     = random_integer.ephemeral_port.result
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = [var.my_ip_cidr]
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
