terraform {
  required_version = "1.15.2"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.85.1"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.28.0"
    }
  }
}
