terraform {
  required_version = "1.14.6"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.78.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.28.0"
    }
  }
}
