terraform {
  required_version = "1.14.5"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.76.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.27.0"
    }
  }
}
