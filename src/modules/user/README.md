# iDRAC User Module

Manages iDRAC user accounts on Dell PowerEdge servers.

## Usage

module "users" {
  source = "../../modules/user"

  idrac_host     = "192.168.1.100"
  idrac_username = "root"
  idrac_password = var.idrac_password

  users = {
    "operator1" = {
      user_id  = 3
      password = var.operator_password
      role     = "Operator"
      enabled  = true
    }
    "monitor1" = {
      user_id  = 4
      password = var.monitor_password
      role     = "ReadOnly"
      enabled  = true
    }
  }
}

## Notes

- User ID 1 is reserved for the root account
- Valid user IDs range from 2 to 16
- Available roles: Administrator, Operator, ReadOnly, None
