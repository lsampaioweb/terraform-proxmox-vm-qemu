test_cases = {
  "01" = {
    # Required:
    target_node = "kvm-05"
    name        = "VM-Networks"
    clone       = "ubuntu-22-04-desktop-standard"

    # Optional:
    description = "VM with multiple networks."

    networks = {
      "01" = {
      },
      "02" = {
        bridge = "vmbr0"
        tag    = 4
      },
      "03" = {
        bridge   = "vmbr1"
        tag      = 100
        firewall = true
        macaddr  = "F2:30:89:8C:02:51"
      }
    }

    cloud_init = {
      # It has to be on the same order as the networks.
      ipconfig0 = "ip=dhcp"
      ipconfig1 = "ip=10.0.100.10/27,gw=10.0.100.1"
    }
  }
}
