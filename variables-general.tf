variable "target_node" {
  description = "The node in the Proxmox cluster to create the VM."
  type        = string
}

variable "name" {
  description = "Name of the VM during creation."
  type        = string
}

variable "vmid" {
  description = "The ID of the VM in Proxmox. The default value of 0 indicates it should use the next available ID in the sequence."
  type        = number
  default     = 0
  nullable    = false

  validation {
    condition     = ((var.vmid == 0) || (var.vmid >= 100))
    error_message = "The vmid should be 0 (for auto generate), 100 or more."
  }
}

variable "description" {
  description = "The description of the VM. Shows as the 'Notes' field in the Proxmox GUI."
  type        = string
  default     = "VM created by Terraform."
  nullable    = false
}

variable "bios" {
  description = "The BIOS to use, options are seabios or ovmf for UEFI."
  type        = string
  default     = "seabios"
  nullable    = false

  validation {
    condition     = contains(["seabios", "ovmf"], var.bios)
    error_message = "Valid values are seabios and ovmf."
  }
}

variable "onboot" {
  description = "Whether to have the VM startup after the PVE node starts."
  type        = bool
  default     = true
  nullable    = false
}

variable "startup" {
  description = "The startup and shutdown behaviour. Format: order=X,up=X,down=X"
  type        = string
  default     = ""
  nullable    = false
}

variable "oncreate" {
  description = "Whether to have the VM startup after the VM is created."
  type        = bool
  default     = true
  nullable    = false
}

variable "pool" {
  description = "Name of resource pool to create virtual machine in."
  type        = string
  default     = ""
  nullable    = false
}
