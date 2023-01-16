resource "cloudflare_zone_settings_override" "dev" {
  zone_id = data.cloudflare_zone.dev.id

  settings {
    always_use_https = "on"
    brotli           = "on"
    min_tls_version  = "1.2"
    ssl              = "full"
    tls_1_3          = "on"
  }
}
