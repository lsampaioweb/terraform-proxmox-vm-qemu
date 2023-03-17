test_cases = {
  "01" = {
    # Required:
    target_node = "kvm-04"
    name        = "VM-Disks"
    clone       = "ubuntu-22-04-desktop-raw"

    # Optional:
    description = "VM with multiple disks."

    disks = {
      "01" = {
        storage = "Ceph_Gold"
        size    = "20G"
      },
      "02" = {
        storage = "Ceph_Silver"
        size    = "15G"
        cache   = "writeback"
      },
      "03" = {
        storage   = "Ceph_Bronze"
        size      = "10G"
        ssd       = 0
        backup    = true
        replicate = 1
      }
    }
  }
}