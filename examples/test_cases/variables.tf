variable "test_cases" {
  description = "The test cases."
  type = map(object({
    # VM
    ## General
    target_node = string
    name        = string
    vmid        = optional(number, 0)
    bios        = optional(string, "seabios")
    description = optional(string)
    onboot      = optional(bool)
    startup     = optional(string)
    oncreate    = optional(bool)
    pool        = optional(string)

    ## Clone
    os_type      = optional(string, "ubuntu")
    clone        = string
    full_clone   = optional(bool)
    force_create = optional(bool)

    ## OS
    tablet  = optional(bool, false)
    boot    = optional(string, "order=scsi0;net0")
    agent   = optional(number, 1)
    qemu_os = optional(string, "l26")
    numa    = optional(bool)
    hotplug = optional(string)
    scsihw  = optional(string, "virtio-scsi-single")
    tags    = optional(string)
    vga = optional(object({
      type   = optional(string)
      memory = optional(number)
    }), {})

    ## CPU
    cpu     = optional(string, "kvm64")
    sockets = optional(number, 1)
    cores   = optional(number, 6)
    vcpus   = optional(number, 2)

    ## Memory
    memory  = optional(number, 3072)
    balloon = optional(number, 1024)

    ## Hard Disk
    disks = optional(map(object({
      type      = optional(string, "scsi")
      storage   = optional(string, "Ceph_Gold")
      size      = optional(string, "20G")
      format    = optional(string, "raw")
      cache     = optional(string, "none")
      backup    = optional(bool, false)
      iothread  = optional(number, 1)
      replicate = optional(number, 0)
      ssd       = optional(number, 1)
      discard   = optional(string, "on")
      })), {
      "01" = {}
    })

    ## Networks
    networks = optional(map(object({
      model    = optional(string, "virtio")
      bridge   = optional(string, "vmbr0")
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
