variable "name" {
  description = "Name of the static IP resource"
  type        = string
}

variable "description" {
  description = "Description of the static IP resource"
  type        = string
  default     = "Static IP for ingress"
}

variable "address_type" {
  description = "Type of the address (EXTERNAL or INTERNAL)"
  type        = string
  default     = "EXTERNAL"
}

variable "ip_version" {
  description = "IP version (IPV4 or IPV6)"
  type        = string
  default     = "IPV4"
}

variable "purpose" {
  description = "Purpose of the static IP (VPC_PEERING, SHARED_LOADBALANCER_VIP, etc.)"
  type        = string
  default     = null
}

variable "prefix_length" {
  description = "Prefix length for the IP range"
  type        = number
  default     = null
} 