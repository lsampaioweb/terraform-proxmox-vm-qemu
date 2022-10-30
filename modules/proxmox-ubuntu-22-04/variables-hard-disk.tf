variable "disk_type" {
  description = "Required. The type of disk device to add. Options: ide, sata, scsi, virtio."
  type        = string
  default     = "scsi"
}

variable "disk_storage" {
  description = "Required. The name of the storage pool on which to store the disk."
  type        = string
  default     = "Ceph_Gold"
}

variable "disk_size" {
  description = "Required. The size of the created disk, format must match the regex \\d+[GMK], where G, M, and K represent Gigabytes, Megabytes, and Kilobytes respectively."
  type        = string
  default     = "20G"
}

variable "disk_format" {
  description = "The format of the file backing the disk. Can be raw, cow, qcow, qed, qcow2, vmdk or cloop. Defaults to raw."
  type        = string
  default     = "raw"
}

variable "disk_cache" {
  description = "The drive's cache mode. Options: directsync, none, unsafe, writeback, writethrough. Defaults to none."
  type        = string
  default     = "none"
}

variable "disk_backup" {
  description = "Whether the drive should be included when making backups. Defaults to 0."
  type        = number
  default     = 0
}

variable "disk_iothread" {
  description = "Whether to use iothreads for this drive. Only effective with a disk of type virtio, or scsi when the emulated controller type (scsihw top level block argument) is virtio-scsi-single. Defaults to 1."
  type        = number
  default     = 1
}

variable "disk_ssd" {
  description = "Whether to expose this drive as an SSD, rather than a rotational hard disk. Defaults to 1."
  type        = number
  default     = 1
}

variable "disk_discard" {
  description = "Controls whether to pass discard/trim requests to the underlying storage. Only effective when the underlying storage supports thin provisioning."
  type        = string
  default     = "on"
}
