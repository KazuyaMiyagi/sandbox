terraform {
  required_version = "1.17.2"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.107.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.29.3"
    }
  }
}
