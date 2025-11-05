terraform {
  required_version = "1.13.5"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.68.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.24.0"
    }
  }
}
