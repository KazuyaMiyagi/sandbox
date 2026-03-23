output "ssh_config" {
  description = "SSH config entry"
  value       = <<-EOT
    Host ${local.prefix}
      HostName ${aws_lightsail_instance.main.public_ip_address}
      User ${aws_lightsail_instance.main.username}
      Port ${random_integer.ssh_port.result}
  EOT
}
