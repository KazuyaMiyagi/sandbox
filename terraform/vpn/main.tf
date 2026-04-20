terraform {
  required_version = "1.14.9"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.84.1"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.28.0"
    }
  }
}
