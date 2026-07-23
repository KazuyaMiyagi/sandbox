terraform {
  required_version = "1.15.8"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.96.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.29.2"
    }
  }
}
