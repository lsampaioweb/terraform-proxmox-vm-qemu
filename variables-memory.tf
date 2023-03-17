variable "balloon" {
  description = "The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired. Proxmox will enable a balloon device on the guest to manage dynamic allocation. Defaults to 0."
  type        = number
  default     = 0
  nullable    = false
}

variable "memory" {
  description = "The amount of memory to allocate to the VM in Megabytes. Defaults to 1024."
  type        = number
  default     = 1024
  nullable    = false
}
