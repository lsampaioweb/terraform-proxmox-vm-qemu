test_cases = {
  "01" = {
    # Required:
    target_node = "kvm-03"
    name        = "VM-Static-IP"
    clone       = "ubuntu-22-04-server-std-docker"

    # Optional:
    description = "VM with Static IP on the default VLAN."

    cloud_init = {
      ipconfig0 = "ip=192.168.0.111/24,gw=192.168.0.2"
    }
  }
}
