terraform {
  required_version = "1.12.2"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.55.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.20.0"
    }
  }
}
