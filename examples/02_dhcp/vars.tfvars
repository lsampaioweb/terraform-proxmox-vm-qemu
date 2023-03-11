test_cases = {
  "01" = {
    # Required:
    target_node = "kvm-02"
    name        = "VM-DHCP"
    clone       = "ubuntu-22-04-server-raw"

    # Optional:
    description = "VM with DHCP on the default VLAN."

    cloud_init = {
      # DHCP is the default, if you want you can omit the line.
      ipconfig0 = "ip=dhcp"
    }
  }
}
