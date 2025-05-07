terraform {
  required_version = "1.11.4"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.53.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.20.0"
    }
  }
}
