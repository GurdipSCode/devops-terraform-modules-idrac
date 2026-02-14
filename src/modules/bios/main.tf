resource "redfish_bios" "this" {
  redfish_server {
    endpoint     = "https://${var.idrac_host}"
    user         = var.idrac_username
    password     = var.idrac_password
    ssl_insecure = true
  }

  attributes          = var.bios_attributes
  settings_apply_time = var.settings_apply_time
  reset_type          = var.reset_type
  reset_timeout       = var.reset_timeout
  job_timeout         = var.job_wait_timeout
}
