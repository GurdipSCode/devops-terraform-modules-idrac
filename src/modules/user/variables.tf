variable "idrac_host" {
  description = "iDRAC host address"
  type        = string
}

variable "idrac_username" {
  description = "iDRAC admin username for authentication"
  type        = string
  default     = "root"
}

variable "idrac_password" {
  description = "iDRAC admin password for authentication"
  type        = string
  sensitive   = true
}

variable "users" {
  description = "Map of iDRAC users to manage"
  type = map(object({
    user_id  = number
    password = string
    role     = string
    enabled  = bool
  }))
  default = {}

  validation {
    condition = alltrue([
      for u in values(var.users) : contains(["Administrator", "Operator", "ReadOnly", "None"], u.role)
    ])
    error_message = "User role must be Administrator, Operator, ReadOnly, or None."
  }

  validation {
    condition = alltrue([
      for u in values(var.users) : u.user_id >= 2 && u.user_id <= 16
    ])
    error_message = "user_id must be between 2 and 16 (1 is reserved for root)."
  }
}
