resource "random_integer" "ssh_port" {
  min = 49152
  max = 65535
}

resource "aws_lightsail_instance" "main" {
  name              = local.prefix
  availability_zone = "ap-northeast-1a"
  blueprint_id      = "openclaw_ls_1_0"
  bundle_id         = "small_3_0"
  key_pair_name     = aws_lightsail_key_pair.main.name
  user_data = templatefile(
    "${path.module}/templates/user_data/init.sh.tftpl",
    {
      ssh_port = random_integer.ssh_port.result,
    }
  )
}

resource "aws_lightsail_key_pair" "main" {
  name       = "${local.prefix}-key"
  public_key = split("\n", trimspace(data.http.github_keys.response_body))[0]
}

resource "aws_lightsail_instance_public_ports" "main" {
  instance_name = aws_lightsail_instance.main.name

  # SSH
  port_info {
    protocol  = "tcp"
    from_port = random_integer.ssh_port.result
    to_port   = random_integer.ssh_port.result
    cidrs     = ["${trimspace(data.http.my_ip.response_body)}/32"]
  }
}
