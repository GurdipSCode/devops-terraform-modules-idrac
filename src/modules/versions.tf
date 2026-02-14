terraform {
  required_version = ">= 1.5.0"

  required_providers {
    redfish = {
      source  = "dell/redfish"
      version = ">= 1.4.0"
    }
  }
}
