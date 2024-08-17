test_cases = {
  "01" = {
    # Required:
    target_node = "edge-pve-02"
    name        = "VM-Other-Values"
    clone       = "ubuntu-24-04-server-standard"

    # Optional:
    description = "VM with several different values."
    vmid        = 1234
    startup     = "order=10"
    tags        = "tag1;tag2"
    vcpus       = 3
    memory      = 4096
  }
}
