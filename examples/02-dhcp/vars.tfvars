test_cases = {
  "01" = {
    # Required:
    target_node = "edge-pve-02"
    name        = "VM-DHCP"
    clone       = "ubuntu-24-04-server-standard"

    # Optional:
    description = "VM with DHCP on the default VLAN."

    cloud_init = {
      # DHCP is the default, if you want you can omit the line.
      ipconfig0 = "ip=dhcp"
    }
  }
}
