output "virtual_disk_ids" {
  description = "Map of virtual disk names to their resource IDs"
  value       = { for k, v in redfish_storage_volume.this : k => v.id }
}
