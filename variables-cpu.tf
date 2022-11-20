variable "cpu" {
  description = "The CPU type to emulate. Defaults to host."
  type        = string
  default     = "kvm64"
}

variable "sockets" {
  description = "How many CPU sockets to give the virtual machine. Defaults to 1."
  type        = number
  default     = 1
}

variable "cores" {
  description = "How many CPU cores to give the virtual machine. Defaults to 1."
  type        = number
  default     = 6
}

variable "vcpus" {
  description = "The number of vCPUs plugged into the VM when it starts. If 0, this is set automatically by Proxmox to sockets * cores."
  type        = number
  default     = 2
}
