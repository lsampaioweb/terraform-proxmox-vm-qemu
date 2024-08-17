test_cases = {
  "01" = {
    # Required:
    target_node = "edge-pve-01"
    name        = "VM-Bare-Minimum"
    clone       = "ubuntu-24-04-server-standard"

    # cloud_init = {
    #   ciuser     = "<user>"
    #   cipassword = "<password>"
    # }
  }

}
