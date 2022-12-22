resource "proxmox_vm_qemu" "main" {
  # https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu

  # General
  target_node = var.target_node
  name        = var.name
  vmid        = var.vmid
  desc        = var.description
  onboot      = var.onboot
  oncreate    = var.oncreate
  pool        = var.pool

  # Clone
  os_type      = var.os_type
  clone        = var.clone
  full_clone   = var.full_clone
  force_create = var.force_create

  # OS
  tablet  = var.tablet
  boot    = var.boot
  agent   = var.agent
  qemu_os = var.qemu_os
  numa    = var.numa
  hotplug = var.hotplug
  scsihw  = var.scsihw
  vga {
    type   = var.vga_type
    memory = var.vga_memory
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
      type     = disk.value.type
      storage  = disk.value.storage
      size     = disk.value.size
      format   = disk.value.format
      cache    = disk.value.cache
      backup   = disk.value.backup
      iothread = disk.value.iothread
      ssd      = disk.value.ssd
      discard  = disk.value.discard
    }
  }

  # Networks
  dynamic "network" {
    for_each = var.networks

    content {
      model    = network.value.model
      bridge   = network.value.bridge
      tag      = network.value.tag
      firewall = network.value.firewall
    }
  }

  # High Availability
  hagroup = var.hagroup
  hastate = var.hastate

  lifecycle {
    ignore_changes = [
      ciuser,
      pool,
      target_node
    ]
  }
}
