# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
# terraform settings
terraform {
  required_version = "1.10.5"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.48.2"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.17.2"
    }
  }
}
