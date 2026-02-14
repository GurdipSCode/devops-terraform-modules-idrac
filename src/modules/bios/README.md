# iDRAC BIOS Module

Manages BIOS configuration on Dell PowerEdge servers via iDRAC Redfish API.

## Usage

module "bios" {
  source = "../../modules/bios"

  idrac_host     = "192.168.1.100"
  idrac_username = "root"
  idrac_password = var.idrac_password

  bios_attributes = {
    "BootMode"           = "Uefi"
    "SysProfile"         = "PerfOptimized"
    "ProcVirtualization" = "Enabled"
    "ProcHyperthreading" = "Enabled"
  }

  settings_apply_time = "OnReset"
  reset_type          = "GracefulRestart"
}

## Common BIOS Attributes

| Attribute | Values | Description |
|-----------|--------|-------------|
| BootMode | Uefi, Bios | System boot mode |
| SysProfile | PerfOptimized, PerfPerWattOptimizedOs, Custom | System profile |
| ProcVirtualization | Enabled, Disabled | Intel VT / AMD-V |
| ProcHyperthreading | Enabled, Disabled | Hyperthreading |
| SriovGlobalEnable | Enabled, Disabled | SR-IOV support |
| MemOpMode | OptimizerMode, SpareMode, MirrorMode | Memory mode |
