variable "os_type" {
  description = "Which provisioning method to use, based on the OS type. Options: ubuntu, centos and cloud-init. Defaults to cloud-init."
  type        = string
  default     = "cloud-init"
  nullable    = false

  validation {
    condition     = contains(["cloud-init", "ubuntu", "centos"], var.os_type)
    error_message = "Valid values are ubuntu, centos and cloud-init."
  }
}

variable "clone" {
  description = "The base VM from which to clone to create the new VM. Note that clone is mutually exclussive with pxe and iso modes."
  type        = string
}

variable "full_clone" {
  description = "Set to true to create a full clone, or false to create a linked clone. Only applies when clone is set. Defaults to true."
  type        = bool
  default     = true
  nullable    = false
}

variable "force_create" {
  description = "If false, and a vm of the same name, on the same node exists, terraform will attempt to reconfigure that VM with these settings. Set to true to always create a new VM (note, the name of the VM must still be unique, otherwise an error will be produced.) Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}
