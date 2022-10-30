variable "memory" {
  description = "The amount of memory to allocate to the VM in Megabytes. Defaults to 512."
  type        = number
  default     = 4096
}

variable "balloon" {
  description = "The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired. Proxmox will enable a balloon device on the guest to manage dynamic allocation."
  type        = number
  default     = 2048
}
