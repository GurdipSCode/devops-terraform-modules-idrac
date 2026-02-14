resource "redfish_user_account" "this" {
  for_each = var.users

  redfish_server {
    endpoint     = "https://${var.idrac_host}"
    user         = var.idrac_username
    password     = var.idrac_password
    ssl_insecure = true
  }

  user_id  = each.value.user_id
  username = each.key
  password = each.value.password
  role_id  = each.value.role
  enabled  = each.value.enabled
}
