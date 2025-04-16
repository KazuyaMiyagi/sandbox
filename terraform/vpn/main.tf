terraform {
  required_version = "1.11.4"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.50.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.19.0"
    }
  }
}
