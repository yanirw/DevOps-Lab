variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR range for the subnet"
  type        = string
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "gke_num_nodes" {
  description = "The number of nodes in the GKE cluster"
  type        = number
}

variable "static_ips" {
  description = "Map of static IP configurations"
  type = map(object({
    name         = string
    description  = string
    address_type = string
    ip_version   = string
  }))
  default = {}
}
