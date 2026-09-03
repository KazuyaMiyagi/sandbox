terraform {
  required_version = "1.16.1"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.100.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.29.2"
    }
  }
}
