resource "tailscale_tailnet_key" "main" {
  reusable      = false
  ephemeral     = true
  preauthorized = true
}
