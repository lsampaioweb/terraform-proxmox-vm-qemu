variable "sockets" {
  description = "How many CPU sockets to give the virtual machine. Defaults to 1."
  type        = number
  default     = 1
}

variable "cores" {
  description = "How many CPU cores to give the virtual machine. Defaults to 1."
  type        = number
  default     = 2
}

variable "cpu" {
  description = "The CPU type to emulate. Defaults to host."
  type        = string
  default     = "kvm64"
}
