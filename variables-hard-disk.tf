variable "disks" {
  description = "Hard Disks for the VM."
  default = {
    "01" = {
      storage = "local-lvm"
    }
  }
  nullable = false
  type = map(object({
    # Required. The type of disk device to add. Options: ide, sata, scsi and virtio. Default to scsi.
    type = optional(string, "scsi")
    # Required. The name of the storage pool on which to store the disk.
    storage = string
    # Required. The size of the created disk, format must match the regex \\d+[GMK], where G, M, and K represent Gigabytes, Megabytes, and Kilobytes respectively. Default to 20G.
    size = optional(string, "20G")
    # The format of the file backing the disk. Options: raw, cow, qcow, qed, qcow2, vmdk and cloop. Defaults to raw.
    format = optional(string)
    # The drive's cache mode. Options: none, directsync, unsafe, writeback and writethrough. Defaults to none.
    cache = optional(string, "none")
    # Whether the drive should be included when making backups. Defaults to false.
    backup = optional(bool, false)
    # Whether to use iothreads for this drive. Only effective with a disk of type virtio, or scsi when the emulated controller type (scsihw top level block argument) is virtio-scsi-single. Defaults to 1.
    iothread = optional(number, 1)
    # Whether the drive should considered for replication jobs. Defaults to 0.
    replicate = optional(number, 0)
    # Whether to expose this drive as an SSD, rather than a rotational hard disk. Defaults to 1.
    ssd = optional(number, 1)
    # Controls whether to pass discard/trim requests to the underlying storage. Only effective when the underlying storage supports thin provisioning. Defaults to "on".
    discard = optional(string, "on")
  }))

  validation {
    condition     = alltrue([for item in var.disks : contains(["scsi", "ide", "sata", "virtio"], item.type)])
    error_message = "Valid values are scsi, ide, sata and virtio."
  }

  validation {
    condition     = alltrue([for item in var.disks : (item.format == null ? true : contains(["raw", "cow", "qcow", "qed", "qcow2", "vmdk", "cloop"], item.format))])
    error_message = "Valid values are raw, cow, qcow, qed, qcow2, vmdk and cloop."
  }

  validation {
    condition     = alltrue([for item in var.disks : (item.cache == null ? true : contains(["none", "directsync", "unsafe", "writeback", "writethrough"], item.cache))])
    error_message = "Valid values are none, directsync, unsafe, writeback and writethrough."
  }
}
