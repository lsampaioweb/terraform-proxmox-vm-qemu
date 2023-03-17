variable "cloud_init" {
  description = "Cloud-init VMs must be cloned from a cloud-init ready template. When creating a resource that is using Cloud-Init, there are multi configurations possible."
  default     = {}
  nullable    = false
  type = object({
    # Instead specifying ciuser, cipasword, etc… you can specify the path to a custom cloud-init config file here. Grants more flexibility in configuring cloud-init.
    cicustom = optional(string)
    # Set the storage location for the cloud-init drive. Required when specifying cicustom.
    cloudinit_cdrom_storage = optional(string)
    # Override the default cloud-init user for provisioning.
    ciuser = optional(string)
    # How to long in seconds to wait for before provisioning.
    ci_wait = optional(number)
    # Override the default cloud-init user's password. Sensitive.
    cipassword = optional(string)
    # Sets default DNS search domain suffix.
    searchdomain = optional(string)
    # Sets default DNS server for guest.
    nameserver = optional(string)
    # Newline delimited list of SSH public keys to add to authorized keys file for the cloud-init user.
    sshkeys = optional(string)
    # The first IP address to assign to the guest. 
    # Format: [ip=<IPv4Format/CIDR>][,gw=<GatewayIPv4>][,ip6=<IPv6Format/CIDR>][,gw6=<GatewayIPv6>].
    # e.g: ip=dhcp
    # e.g: ip=10.0.4.4/27,gw=10.0.4.1
    # Defaults to ip=dhcp.
    ipconfig0 = optional(string, "ip=dhcp")
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig1 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig2 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig3 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig4 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig5 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig6 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig7 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig8 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig9 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig10 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig11 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig12 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig13 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig14 = optional(string)
    # The Nth IP address to assign to the guest. Same format as ipconfig0.
    ipconfig15 = optional(string)
  })
}
