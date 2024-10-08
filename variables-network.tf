variable "define_connection_info" {
  description = "Whether to let terraform define the (SSH) connection parameters for preprovisioners, see config block below. Defaults to true."
  type        = bool
  default     = true
  nullable    = false
}

variable "os_network_config" {
  description = "Only applies when define_connection_info is true. Network configuration to be copied into the VM when preprovisioning ubuntu or centos guests. The specified configuration is added to /etc/network/interfaces for Ubuntu, or /etc/sysconfig/network-scripts/ifcfg-eth0 for CentOS. Forces re-creation on change. Defaults to empty."
  type        = string
  default     = ""
  nullable    = false
}

variable "networks" {
  description = "Network configuration for the VM."
  default = {
    "01" = {}
  }
  nullable = false
  type = map(object({
    # Required. Bridge to which the network device should be attached. The Proxmox VE standard bridge is called vmbr0. Defaults to vmbr0.
    bridge = optional(string, "vmbr2")
    # Required. Network Card Model. The virtio model provides the best performance with very low CPU overhead. If your guest does not support this driver, it is usually best to use e1000. Options: virtio, e1000, e1000-82540em, e1000-82544gc, e1000-82545em, i82551, i82557b, i82559er, ne2k_isa, ne2k_pci, pcnet, rtl8139, vmxnet3. Defaults to virtio.
    model = optional(string, "virtio")
    # The VLAN tag to apply to packets on this device. -1 disables VLAN tagging.
    tag = optional(number)
    # Whether to enable the Proxmox firewall on this network device. Defaults to false.
    firewall = optional(bool)
    # Override the randomly generated MAC Address for the VM.
    macaddr = optional(string)
  }))

  validation {
    condition = alltrue([for item in var.networks :
    contains(["virtio", "e1000", "e1000-82540em", "e1000-82544gc", "e1000-82545em", "i82551", "i82557b", "i82559er", "ne2k_isa", "ne2k_pci", "pcnet", "rtl8139", "vmxnet3"], item.model)])
    error_message = "Valid values are virtio, e1000, e1000-82540em, e1000-82544gc, e1000-82545em, i82551, i82557b, i82559er, ne2k_isa, ne2k_pci, pcnet, rtl8139 and vmxnet3."
  }
}
