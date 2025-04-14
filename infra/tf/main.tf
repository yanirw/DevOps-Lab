provider "google" {
  project = var.project_id
  region  = var.region
}

# terraform {
#   backend "gcs" {
#     bucket = "bucket-gu"
#     prefix = "terraform/state"
#   }
# }

module "GKE" {
  source = "./modules/GKE" 
  gke_cluster_name  = var.gke_cluster_name
  project_id        = var.project_id   
  region            = var.region     
  vpc_name          = var.vpc_name    
  subnet_name       = var.subnet_name 
  subnet_cidr       = var.subnet_cidr
  gke_num_nodes     = var.gke_num_nodes
}

# Static IPs
module "static_ips" {
  source = "./modules/static_ip"
  for_each = var.static_ips

  name         = each.value.name
  description  = each.value.description
  address_type = each.value.address_type
  ip_version   = each.value.ip_version
}
