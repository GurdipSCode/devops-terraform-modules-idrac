variable "idrac_host" {
  description = "iDRAC host address (IP or FQDN)"
  type        = string
}

variable "idrac_username" {
  description = "iDRAC username"
  type        = string
  default     = "root"
}

variable "idrac_password" {
  description = "iDRAC password"
  type        = string
  sensitive   = true
}

variable "idrac_port" {
  description = "iDRAC HTTPS port"
  type        = number
  default     = 443
}

variable "idrac_ssl_verify" {
  description = "Verify SSL certificate"
  type        = bool
  default     = true
}
