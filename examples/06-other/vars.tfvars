test_cases = {
  "01" = {
    # Required:
    target_node = "kvm-06"
    name        = "VM-Other-Values"
    clone       = "ubuntu-22-04-server-raw"

    # Optional:
    description = "VM with several different values."
    vmid        = 123
    startup     = "order=10"
    tags        = "tag1;tag2"
    vcpus       = 3
    memory      = 4096
  }
}
