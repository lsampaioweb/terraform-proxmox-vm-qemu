test_cases = {
  "01" = {
    # Required:
    target_node = "edge-pve-01"
    name        = "VM-Static-IP"
    clone       = "ubuntu-24-04-server-std-docker"

    # Optional:
    description = "VM with Static IP on the default VLAN."

    cloud_init = {
      ipconfig0 = "ip=192.168.101.2/28,gw=192.168.101.1"
    }
  }
}
