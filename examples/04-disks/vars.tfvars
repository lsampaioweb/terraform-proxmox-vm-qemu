test_cases = {
  "01" = {
    # Required:
    target_node = "kvm-04"
    name        = "VM-Disks"
    clone       = "ubuntu-22-04-server-raw"

    # Optional:
    description = "VM with multiple disks."

    disks = {
      "01" = {
        storage = "Ceph_Gold"
        size    = "20G"
      },
      "02" = {
        storage = "Ceph_Silver"
        size    = "10G"
        cache   = "writeback"
      },
      "03" = {
        storage   = "Ceph_Bronze"
        size      = "30G"
        ssd       = 0
        backup    = true
        replicate = 1
      }
    }
  }
}
