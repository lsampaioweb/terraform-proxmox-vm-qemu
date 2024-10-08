variable "tablet" {
  description = "Enable/disable the USB tablet device. This device is usually needed to allow absolute mouse positioning with VNC. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "boot" {
  description = "The boot order for the VM. Ordered string of characters denoting boot order. Options: floppy (a), hard disk (c), CD-ROM (d), or network (n). Defaults to empty."
  type        = string
  default     = ""
  nullable    = false
}

variable "agent" {
  description = "Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the guest for this to have any effect. Defaults to 1."
  type        = number
  default     = 1
  nullable    = false
}

variable "qemu_os" {
  description = "The type of OS in the guest. Set properly to allow Proxmox to enable optimizations for the appropriate guest OS. It takes the value from the source template and ignore any changes to resource configuration parameter. Defaults to l26."
  type        = string
  default     = "l26"
  nullable    = false
}

variable "numa" {
  description = "Whether to enable Non-Uniform Memory Access in the guest. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "hotplug" {
  description = "Comma delimited list of hotplug features to enable. Options: network, disk, cpu, memory, usb. Set to 0 to disable hotplug. Defaults to disk,network,cpu."
  type        = string
  default     = "disk,network,cpu"
  nullable    = false
}

variable "scsihw" {
  description = "The SCSI controller model to emulate. Can be lsi, lsi53c810, virtio-scsi-pci, virtio-scsi-single, megasas, or pvscsi. Defaults to virtio-scsi-single."
  type        = string
  default     = "virtio-scsi-single"
  nullable    = false

  validation {
    condition     = contains(["virtio-scsi-single", "lsi", "lsi53c810", "virtio-scsi-pci", "megasas", "pvscsi"], var.scsihw)
    error_message = "Valid values are virtio-scsi-single, lsi, lsi53c810, virtio-scsi-pci, megasas, or pvscsi."
  }
}

variable "tags" {
  description = "Tags of the VM. Comma-separated values (e.g. tag1,tag2,tag3). Tag may only include the following characters: [a-z], [0-9] and _. This is only meta information. Defaults to empty."
  type        = string
  default     = ""
  nullable    = false
}

variable "vga" {
  description = "Type: The type of display to virtualize. Options: std, cirrus, qxl, qxl2, qxl3, qxl4, none, serial0, serial1, serial2, serial3, virtio, virtio-gl, vmware. Memory: Sets the VGA memory (in MiB). Has no effect with serial display type. Defaults to std and 16M."
  type = object({
    type   = optional(string, "std")
    memory = optional(number, 16)
  })
  default  = {}
  nullable = false

  validation {
    condition     = contains(["std", "cirrus", "none", "qxl", "qxl2", "qxl3", "qxl4", "serial0", "serial1", "serial2", "serial3", "virtio", "virtio-gl", "vmware"], var.vga.type)
    error_message = "Valid values are std, cirrus, none, qxl, qxl2, qxl3, qxl4, serial0, serial1, serial2, serial3, virtio and vmware."
  }

}
