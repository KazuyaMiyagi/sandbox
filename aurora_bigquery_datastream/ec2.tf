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
  security_groups             = [aws_security_group.datastream_bastion.name]
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
      datastream_ssh_authorized_key = var.datastream_public_key
      ssh_port                      = random_integer.ephemeral_port.result
    }
  )

  tags = {
    Name = "bastion"
  }

  # sandbox only settings
  disable_api_stop        = false
  disable_api_termination = false
}
