variable "test_cases" {
  description = "The test cases."
  type = map(object({
    # VM
    ## General
    target_node = string
    name        = string
    vmid        = optional(number)
    bios        = optional(string)
    description = optional(string)
    onboot      = optional(bool)
    startup     = optional(string)
    oncreate    = optional(bool)
    pool        = optional(string)

    ## Clone
    os_type      = optional(string)
    clone        = string
    full_clone   = optional(bool)
    force_create = optional(bool)

    ## Cloud Init
    cloud_init = optional(object({
      cicustom                = optional(string)
      cloudinit_cdrom_storage = optional(string, "Ceph_Gold")
      ciuser                  = optional(string)
      ci_wait                 = optional(number)
      cipassword              = optional(string)
      searchdomain            = optional(string)
      nameserver              = optional(string)
      sshkeys                 = optional(string)
      ipconfig0               = optional(string)
      ipconfig1               = optional(string)
      ipconfig2               = optional(string)
      ipconfig3               = optional(string)
      ipconfig4               = optional(string)
      ipconfig5               = optional(string)
      ipconfig6               = optional(string)
      ipconfig7               = optional(string)
      ipconfig8               = optional(string)
      ipconfig9               = optional(string)
      ipconfig10              = optional(string)
      ipconfig11              = optional(string)
      ipconfig12              = optional(string)
      ipconfig13              = optional(string)
      ipconfig14              = optional(string)
      ipconfig15              = optional(string)
    }))

    ## OS
    tablet  = optional(bool)
    boot    = optional(string, "order=scsi0;net0")
    agent   = optional(number)
    qemu_os = optional(string)
    numa    = optional(bool)
    hotplug = optional(string)
    scsihw  = optional(string)
    tags    = optional(string)
    vga = optional(object({
      type   = optional(string)
      memory = optional(number)
    }))

    ## CPU
    cpu     = optional(string, "kvm64")
    sockets = optional(number, 1)
    cores   = optional(number, 6)
    vcpus   = optional(number, 2)

    ## Memory
    balloon = optional(number, 1024)
    memory  = optional(number, 3072)

    ## Hard Disk
    disks = optional(map(object({
      type      = optional(string)
      storage   = optional(string, "Ceph_Gold")
      size      = optional(string)
      format    = optional(string)
      cache     = optional(string)
      backup    = optional(bool)
      iothread  = optional(number)
      replicate = optional(number)
      ssd       = optional(number)
      discard   = optional(string)
      })), {
      "01" = {}
    })

    ## Networks
    define_connection_info = optional(bool)
    os_network_config      = optional(string)

    networks = optional(map(object({
      model    = optional(string)
      bridge   = optional(string)
      tag      = optional(number)
      firewall = optional(bool)
      macaddr  = optional(string)
      })), {
      "01" = {}
    })

    ## High Availability
    hagroup = optional(string, "default")
    hastate = optional(string, "started")
  }))
}
