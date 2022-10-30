variable "clone" {
  description = "The base VM from which to clone to create the new VM. Note that clone is mutually exclussive with pxe and iso modes."
  type        = string
}

variable "full_clone" {
  description = "Set to true to create a full clone, or false to create a linked clone. Only applies when clone is set."
  type        = bool
  default     = true
}

variable "force_create" {
  description = "If false, and a vm of the same name, on the same node exists, terraform will attempt to reconfigure that VM with these settings. Set to true to always create a new VM (note, the name of the VM must still be unique, otherwise an error will be produced.)"
  type        = bool
  default     = false
}
