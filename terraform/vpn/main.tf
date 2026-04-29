terraform {
  required_version = "1.15.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.85.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.28.0"
    }
  }
}
