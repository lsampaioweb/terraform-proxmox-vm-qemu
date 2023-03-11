test_cases = {
  "01" = {
    # Required:
    target_node = "kvm-05"
    name        = "VM-Networks"
    clone       = "ubuntu-22-04-server-raw"

    # Optional:
    description = "VM with multiple networks."

    networks = {
      "01" = {
        bridge   = "vmbr0"
        tag      = 4
        firewall = true
      },
      "02" = {
        tag = 100
      }
    }

    cloud_init = {
      # It has to be on the same order as the networks.
      ipconfig0 = "ip=dhcp"
      ipconfig1 = "ip=10.0.100.10/27,gw=10.0.100.1"
    }
  }
}
