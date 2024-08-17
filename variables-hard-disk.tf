variable "disks" {
  description = "Hard Disks for the VM."
  nullable    = false

  default = {
    scsi = {
      scsi0 = {
        disk = [{}]
      }
    }
  }

  type = object({
    scsi = object({
      # disk0 (required)
      scsi0 = object({
        disk = list(object({
          backup     = optional(bool, true)
          cache      = optional(string, "")
          discard    = optional(bool, true)
          emulatessd = optional(bool, true)
          format     = optional(string, "raw")
          iothread   = optional(bool, true)
          replicate  = optional(bool, true)
          size       = optional(string, "20G")
          storage    = optional(string, "Ceph_Gold")
        }))
      })

      # disk1 (optional)
      scsi1 = optional(object({
        disk = optional(list(object({
          backup     = optional(bool, true)
          cache      = optional(string, "")
          discard    = optional(bool, true)
          emulatessd = optional(bool, true)
          format     = optional(string, "raw")
          iothread   = optional(bool, true)
          replicate  = optional(bool, true)
          size       = optional(string, "20G")
          storage    = optional(string, "Ceph_Gold")
        })), [])
      }), {})

      # disk2 (optional)
      scsi2 = optional(object({
        disk = optional(list(object({
          backup     = optional(bool, true)
          cache      = optional(string, "")
          discard    = optional(bool, true)
          emulatessd = optional(bool, true)
          format     = optional(string, "raw")
          iothread   = optional(bool, true)
          replicate  = optional(bool, true)
          size       = optional(string, "20G")
          storage    = optional(string, "Ceph_Gold")
        })), [])
      }), {})

      # disk3 (optional)
      scsi3 = optional(object({
        disk = optional(list(object({
          backup     = optional(bool, true)
          cache      = optional(string, "")
          discard    = optional(bool, true)
          emulatessd = optional(bool, true)
          format     = optional(string, "raw")
          iothread   = optional(bool, true)
          replicate  = optional(bool, true)
          size       = optional(string, "20G")
          storage    = optional(string, "Ceph_Gold")
        })), [])
      }), {})

      # init-cloud drive (optional)
      scsi10 = optional(object({
        cloudinit = optional(list(object({
          storage = optional(string, "Ceph_Gold")
        })), [])
      }), {})

    })
  })
}
