test_cases = {
  "01" = {
    target_node = "kvm-07"
    name        = "VM-Static-IP"
    clone       = "ubuntu-22-04-server-raw"
    description = "VM with Static IP on the default VLAN."

    cloud_init = {
      ipconfig0    = "ip=192.168.0.123/24,gw=192.168.0.2"
      searchdomain = "homelab"
    }
  }
}
