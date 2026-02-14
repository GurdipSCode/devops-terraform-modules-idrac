resource "redfish_storage_volume" "this" {
  for_each = var.virtual_disks

  redfish_server {
    endpoint     = "https://${var.idrac_host}"
    user         = var.idrac_username
    password     = var.idrac_password
    ssl_insecure = true
  }

  storage_controller_id = each.value.controller_id
  volume_name           = coalesce(each.value.name, each.key)
  volume_type           = each.value.raid_level
  drives                = each.value.physical_disk_ids
  settings_apply_time   = var.settings_apply_time
  reset_type            = var.reset_type
  reset_timeout         = var.reset_timeout

  capacity_bytes = each.value.capacity_bytes

  optimum_io_size_bytes = each.value.optimum_io_size
  read_cache_policy     = each.value.read_policy
  write_cache_policy    = each.value.write_policy
  disk_cache_policy     = each.value.disk_cache_policy
}
