terraform {
  required_version = "1.14.2"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.71.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.24.0"
    }
  }
}
