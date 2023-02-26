test_cases = {
  "01" = {
    target_node = "kvm-01"
    name        = "VM-01"
    clone       = "template-01"
    networks = {
      tag = 100
    }

  },
  "02" = {
    target_node = "kvm-02"
    name        = "VM-02"
    clone       = "template-02"
    networks = {
      "01" = {
        bridge = "vmbr0"
        tag    = 100
      }
    }
  },
  "03" = {
    target_node = "kvm-03"
    name        = "VM-03"
    clone       = "template-03"
    disks = {
      "01" = {
        storage = "Silver"
        size    = "30G"
      }
    }
  }
}
