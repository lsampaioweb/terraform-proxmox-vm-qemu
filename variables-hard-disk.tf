variable "disks" {
  description = "Hard Disks for the VM."
  type = map(object({
    # Required. The type of disk device to add. Options: ide, sata, scsi, virtio.
    type = string
    # Required. The name of the storage pool on which to store the disk.
    storage = string
    # Required. The size of the created disk, format must match the regex \\d+[GMK], where G, M, and K represent Gigabytes, Megabytes, and Kilobytes respectively.
    size = string
    # The format of the file backing the disk. Can be raw, cow, qcow, qed, qcow2, vmdk or cloop. Defaults to raw.
    format = string
    # The drive's cache mode. Options: directsync, none, unsafe, writeback, writethrough. Defaults to none.
    cache = string
    # Whether the drive should be included when making backups. Defaults to 0.
    backup = number
    # Whether to use iothreads for this drive. Only effective with a disk of type virtio, or scsi when the emulated controller type (scsihw top level block argument) is virtio-scsi-single. Defaults to 1.
    iothread = number
    # Whether to expose this drive as an SSD, rather than a rotational hard disk. Defaults to 1.
    ssd = number
    # Controls whether to pass discard/trim requests to the underlying storage. Only effective when the underlying storage supports thin provisioning.
    discard = string
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
}
