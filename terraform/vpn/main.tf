terraform {
  required_version = "1.14.8"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.84.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.28.0"
    }
  }
}
