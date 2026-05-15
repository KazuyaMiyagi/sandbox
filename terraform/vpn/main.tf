terraform {
  required_version = "1.15.3"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.86.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.29.0"
    }
  }
}
