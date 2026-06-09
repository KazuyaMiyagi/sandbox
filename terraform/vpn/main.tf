terraform {
  required_version = "1.15.5"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.88.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.29.2"
    }
  }
}
