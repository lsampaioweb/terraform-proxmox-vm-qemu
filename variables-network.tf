variable "networks" {
  description = "Network configuration for the VM."
  type = map(object({
    bridge   = string           # Required. Bridge to which the network device should be attached. The Proxmox VE standard bridge is called vmbr0.
    model    = string           # Required. Network Card Model. The virtio model provides the best performance with very low CPU overhead. If your guest does not support this driver, it is usually best to use e1000. Options: virtio, e1000, e1000-82540em, e1000-82544gc, e1000-82545em, i82551, i82557b, i82559er, ne2k_isa, ne2k_pci, pcnet, rtl8139, vmxnet3.
    tag      = optional(number) # The VLAN tag to apply to packets on this device. -1 disables VLAN tagging.
    firewall = optional(bool)   # Whether to enable the Proxmox firewall on this network device. Defaults to false.
    macaddr  = optional(string) # Override the randomly generated MAC Address for the VM.
  }))

  default = {
    "01" = {
      # WAN
      bridge = "vmbr0"
      model  = "virtio"
    }
  }

  validation {
    condition = alltrue([for item in var.networks :
    contains(["virtio", "e1000", "e1000-82540em", "e1000-82544gc", "e1000-82545em", "i82551", "i82557b", "i82559er", "ne2k_isa", "ne2k_pci", "pcnet", "rtl8139", "vmxnet3"], item.model)])
    error_message = "Valid values are virtio, e1000, e1000-82540em, e1000-82544gc, e1000-82545em, i82551, i82557b, i82559er, ne2k_isa, ne2k_pci, pcnet, rtl8139 and vmxnet3."
  }
}
