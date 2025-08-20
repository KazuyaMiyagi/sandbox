terraform {
  required_version = "1.13.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.65.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.21.1"
    }
  }
}
