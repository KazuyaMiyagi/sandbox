terraform {
  required_version = "1.14.3"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.73.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.25.0"
    }
  }
}
