output "ip_address" {
  description = "The static IP address"
  value       = google_compute_global_address.static_ip.address
}

output "self_link" {
  description = "The URI of the created resource"
  value       = google_compute_global_address.static_ip.self_link
}

output "name" {
  description = "The name of the created resource"
  value       = google_compute_global_address.static_ip.name
} 