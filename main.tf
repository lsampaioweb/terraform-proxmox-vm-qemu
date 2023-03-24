resource "proxmox_vm_qemu" "main" {
  # https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu

  # General
  target_node = var.target_node
  name        = var.name
  vmid        = var.vmid
  bios        = var.bios
  onboot      = var.onboot
  startup     = var.startup
  oncreate    = var.oncreate
  desc        = var.description
  pool        = var.pool

  # Clone
  os_type      = var.os_type
  clone        = var.clone
  full_clone   = var.full_clone
  force_create = var.force_create

  # Cloud-Init
  cicustom                = var.cloud_init.cicustom
  cloudinit_cdrom_storage = var.cloud_init.cloudinit_cdrom_storage
  ciuser                  = var.cloud_init.ciuser
  ci_wait                 = var.cloud_init.ci_wait
  cipassword              = var.cloud_init.cipassword
  searchdomain            = var.cloud_init.searchdomain
  nameserver              = var.cloud_init.nameserver
  sshkeys                 = var.cloud_init.sshkeys
  ipconfig0               = var.cloud_init.ipconfig0
  ipconfig1               = var.cloud_init.ipconfig1
  ipconfig2               = var.cloud_init.ipconfig2
  ipconfig3               = var.cloud_init.ipconfig3
  ipconfig4               = var.cloud_init.ipconfig4
  ipconfig5               = var.cloud_init.ipconfig5
  ipconfig6               = var.cloud_init.ipconfig6
  ipconfig7               = var.cloud_init.ipconfig7
  ipconfig8               = var.cloud_init.ipconfig8
  ipconfig9               = var.cloud_init.ipconfig9
  ipconfig10              = var.cloud_init.ipconfig10
  ipconfig11              = var.cloud_init.ipconfig11
  ipconfig12              = var.cloud_init.ipconfig12
  ipconfig13              = var.cloud_init.ipconfig13
  ipconfig14              = var.cloud_init.ipconfig14
  ipconfig15              = var.cloud_init.ipconfig15

  # OS  
  tablet  = var.tablet
  boot    = var.boot
  agent   = var.agent
  qemu_os = var.qemu_os
  numa    = var.numa
  hotplug = var.hotplug
  scsihw  = var.scsihw
  tags    = var.tags
  vga {
    type   = var.vga.type
    memory = var.vga.memory
  }

  # CPU
  cpu     = var.cpu
  sockets = var.sockets
  cores   = var.cores
  vcpus   = var.vcpus

  # Memory
  memory  = var.memory
  balloon = var.balloon

  # Hard Disk
  dynamic "disk" {
    for_each = var.disks

    content {
      type      = disk.value.type
      storage   = disk.value.storage
      size      = disk.value.size
      format    = disk.value.format
      cache     = disk.value.cache
      backup    = disk.value.backup
      iothread  = disk.value.iothread
      replicate = disk.value.replicate
      ssd       = disk.value.ssd
      discard   = disk.value.discard
    }
  }

  # Networks
  define_connection_info = var.define_connection_info
  os_network_config      = var.os_network_config

  dynamic "network" {
    for_each = var.networks

    content {
      model    = network.value.model
      bridge   = network.value.bridge
      tag      = network.value.tag
      firewall = network.value.firewall
      macaddr  = network.value.macaddr
    }
  }

  # High Availability
  hagroup = var.hagroup
  hastate = var.hastate

  lifecycle {
    create_before_destroy = true

    ignore_changes = [target_node, pool, ciuser]
  }
}
