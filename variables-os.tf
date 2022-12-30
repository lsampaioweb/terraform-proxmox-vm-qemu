variable "tablet" {
  description = "Enable/disable the USB tablet device. This device is usually needed to allow absolute mouse positioning with VNC."
  type        = bool
  default     = false
}

variable "boot" {
  description = "The boot order for the VM. Ordered string of characters denoting boot order. Options: floppy (a), hard disk (c), CD-ROM (d), or network (n)."
  type        = string
  default     = "order=scsi0"
}

variable "agent" {
  description = "Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the guest for this to have any effect."
  type        = number
  default     = 1
}

variable "qemu_os" {
  description = "The type of OS in the guest. Set properly to allow Proxmox to enable optimizations for the appropriate guest OS. It takes the value from the source template and ignore any changes to resource configuration parameter."
  type        = string
  default     = "l26"
}

variable "numa" {
  description = "Whether to enable Non-Uniform Memory Access in the guest."
  type        = bool
  default     = false
}

variable "hotplug" {
  description = "Comma delimited list of hotplug features to enable. Options: network, disk, cpu, memory, usb. Set to 0 to disable hotplug."
  type        = string
  default     = "disk,network,cpu"
}

variable "scsihw" {
  description = "The SCSI controller model to emulate. Can be lsi, lsi53c810, virtio-scsi-pci, virtio-scsi-single, megasas, or pvscsi. Defaults to virtio-scsi-single."
  type        = string
  default     = "virtio-scsi-single"

  validation {
    condition     = contains(["virtio-scsi-single", "lsi", "lsi53c810", "virtio-scsi-pci", "megasas", "pvscsi"], var.scsihw)
    error_message = "Valid values are virtio-scsi-single, lsi, lsi53c810, virtio-scsi-pci, megasas, or pvscsi."
  }
}

variable "vga_type" {
  description = "The type of display to virtualize. Options: std, cirrus, none, qxl, qxl2, qxl3, qxl4, serial0, serial1, serial2, serial3, virtio, vmware. Defaults to std."
  type        = string
  default     = "std"

  validation {
    condition     = contains(["std", "cirrus", "none", "qxl", "qxl2", "qxl3", "qxl4", "serial0", "serial1", "serial2", "serial3", "virtio", "vmware"], var.vga_type)
    error_message = "Valid values are std, cirrus, none, qxl, qxl2, qxl3, qxl4, serial0, serial1, serial2, serial3, virtio and vmware."
  }
}

variable "vga_memory" {
  description = "Sets the VGA memory (in MiB). Has no effect with serial display type."
  type        = number
  default     = 0
}
