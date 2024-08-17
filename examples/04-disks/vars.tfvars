test_cases = {
  "01" = {
    # Required:
    target_node = "edge-pve-02"
    name        = "VM-Disks"
    clone       = "ubuntu-24-04-desktop-raw"

    # Optional:
    description = "VM with multiple disks."

    disks = {
      scsi = {
        # disk0 (required)
        scsi0 = {
          disk = [{}]
        }
        # disk1 (optional)
        scsi1 = {
          disk = []
        }
        # disk2 (optional)
        scsi2 = {
          disk = [{
            size    = "15G"
            storage = "Ceph_Gold"
          }]
        }
        scsi3 = {
          disk = [{
            backup     = true
            cache      = ""
            discard    = true
            emulatessd = true
            format     = "raw"
            iothread   = true
            replicate  = true
            size       = "16G"
            storage    = "Ceph_Gold"
          }]
        }
        # init-cloud drive (optional)
        scsi10 = {
          cloudinit = [{}]
        }
      }
    }
  }
}
