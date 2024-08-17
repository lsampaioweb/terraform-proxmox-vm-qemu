test_cases = {
  "01" = {
    # Required:
    target_node = "edge-pve-01"
    name        = "VM-Networks"
    clone       = "ubuntu-24-04-desktop-standard"

    # Optional:
    description = "VM with multiple networks."

    networks = {
      "01" = {
      },
      "02" = {
        bridge = "vmbr2"
        tag    = 100
      },
      "03" = {
        bridge   = "vmbr2"
        tag      = 101
        firewall = true
        macaddr  = "F2:30:89:8C:02:51"
      }
    }

    cloud_init = {
      # It has to be on the same order as the networks.
      ipconfig0 = "ip=dhcp"
      ipconfig1 = "ip=dhcp"
      ipconfig2 = "ip=192.168.101.3/28,gw=192.168.101.1"
    }
  }
}
