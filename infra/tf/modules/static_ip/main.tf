resource "google_compute_global_address" "static_ip" {
  name         = var.name
  description  = var.description
  address_type = var.address_type
  ip_version   = var.ip_version
  purpose      = var.purpose
  prefix_length = var.prefix_length
}

