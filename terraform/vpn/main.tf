terraform {
  required_version = "1.12.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.54.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.20.0"
    }
  }
}
