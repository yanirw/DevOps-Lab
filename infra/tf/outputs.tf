output "grafana_static_ip" {
  description = "The static IP address for Grafana ingress"
  value       = module.grafana_static_ip.ip_address
}

output "static_ips" {
  description = "Map of static IP addresses"
  value = {
    for k, v in module.static_ips : k => {
      ip_address = v.ip_address
      self_link = v.self_link
      name      = v.name
    }
  }
}
