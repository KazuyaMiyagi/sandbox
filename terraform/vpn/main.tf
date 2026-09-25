terraform {
  required_version = "1.16.4"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.101.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.29.2"
    }
  }
}
