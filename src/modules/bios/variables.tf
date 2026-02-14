variable "idrac_host" {
  description = "iDRAC host address"
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

variable "bios_attributes" {
  description = "Map of BIOS attributes to configure"
  type        = map(string)
  default     = {}
}

variable "reset_type" {
  description = "Reset type after BIOS change (ForceRestart, GracefulRestart, PowerCycle)"
  type        = string
  default     = "GracefulRestart"

  validation {
    condition     = contains(["ForceRestart", "GracefulRestart", "PowerCycle"], var.reset_type)
    error_message = "reset_type must be ForceRestart, GracefulRestart, or PowerCycle."
  }
}

variable "reset_timeout" {
  description = "Timeout in seconds for server reset"
  type        = number
  default     = 300
}

variable "job_wait_timeout" {
  description = "Timeout in seconds for the BIOS config job"
  type        = number
  default     = 1200
}

variable "settings_apply_time" {
  description = "When to apply settings (Immediate, OnReset, AtMaintenanceWindowStart)"
  type        = string
  default     = "OnReset"

  validation {
    condition     = contains(["Immediate", "OnReset", "AtMaintenanceWindowStart"], var.settings_apply_time)
    error_message = "settings_apply_time must be Immediate, OnReset, or AtMaintenanceWindowStart."
  }
}
