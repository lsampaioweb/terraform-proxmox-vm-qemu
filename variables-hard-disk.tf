variable "disks" {
  description = "Hard Disks for the VM."
  type = map(object({
    type     = string # Required. The type of disk device to add. Options: ide, sata, scsi and virtio.
    storage  = string # Required. The name of the storage pool on which to store the disk.
    size     = string # Required. The size of the created disk, format must match the regex \\d+[GMK], where G, M, and K represent Gigabytes, Megabytes, and Kilobytes respectively.
    format   = string # The format of the file backing the disk. Options: raw, cow, qcow, qed, qcow2, vmdk and cloop. Defaults to raw.
    cache    = string # The drive's cache mode. Options: none, directsync, unsafe, writeback and writethrough. Defaults to none.
    backup   = number # Whether the drive should be included when making backups. Defaults to 0.
    iothread = number # Whether to use iothreads for this drive. Only effective with a disk of type virtio, or scsi when the emulated controller type (scsihw top level block argument) is virtio-scsi-single. Defaults to 1.
    ssd      = number # Whether to expose this drive as an SSD, rather than a rotational hard disk. Defaults to 1.
    discard  = string # Controls whether to pass discard/trim requests to the underlying storage. Only effective when the underlying storage supports thin provisioning.
  }))

  default = {
    "01" = {
      type     = "scsi"
      storage  = "Ceph_Gold"
      size     = "20G"
      format   = "raw"
      cache    = "none"
      backup   = 0
      iothread = 1
      ssd      = 1
      discard  = "on"
    }
  }

  validation {
    condition     = alltrue([for item in var.disks : contains(["scsi", "ide", "sata", "virtio"], item.type)])
    error_message = "Valid values are scsi, ide, sata and virtio."
  }

  validation {
    condition     = alltrue([for item in var.disks : contains(["raw", "cow", "qcow", "qed", "qcow2", "vmdk", "cloop"], item.format)])
    error_message = "Valid values are raw, cow, qcow, qed, qcow2, vmdk and cloop."
  }

  validation {
    condition     = alltrue([for item in var.disks : contains(["none", "directsync", "unsafe", "writeback", "writethrough"], item.cache)])
    error_message = "Valid values are none, directsync, unsafe, writeback and writethrough."
  }
}
