terraform {
  required_version = "1.14.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.69.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.24.0"
    }
  }
}
