resource "random_integer" "ephemeral_port" {
  min = 49152
  max = 65535
}

resource "aws_iam_instance_profile" "datastream_bastion" {
  name = aws_iam_role.datastream_bastion.name
  role = aws_iam_role.datastream_bastion.name
}

# trivy:ignore:AVD-AWS-0131
resource "aws_instance" "datastream_bastion" {
  ami                         = data.aws_ssm_parameter.amazonlinux_2.value
  instance_type               = "t4g.nano"
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.datastream_bastion.id]
  associate_public_ip_address = true
  monitoring                  = true
  iam_instance_profile        = aws_iam_instance_profile.datastream_bastion.name

  root_block_device {
    volume_type           = "standard"
    volume_size           = "10"
    delete_on_termination = true
  }

  user_data = templatefile(
    "./templates/cloud_init/datastream_bastion.cfg.tftpl",
    {
      datastream_ssh_authorized_key = tls_private_key.datastream.public_key_openssh
      ssh_port                      = random_integer.ephemeral_port.result
    }
  )

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "bastion"
  }

  # sandbox only settings
  disable_api_stop        = false
  disable_api_termination = false
}
