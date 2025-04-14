project_id = "logical-acolyte-423107-b5"
region = "us-east1"
vpc_name = "demo-vpc-2"
subnet_name = "demo-private-subnet-1"
subnet_cidr  = "10.0.1.0/24"
gke_cluster_name = "demo-dev-1"
gke_num_nodes = 1

# Static IP Configuration
static_ips = {
  grafana = {
    name         = "grafana-static-ip"
    description  = "Static IP for Grafana ingress"
    address_type = "EXTERNAL"
    ip_version   = "IPV4"
  },
  argocd = {
    name         = "argocd-ip"
    description  = "Static IP for ArgoCD ingress"
    address_type = "EXTERNAL"
    ip_version   = "IPV4"
  }
}
