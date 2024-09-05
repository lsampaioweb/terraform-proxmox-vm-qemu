resource "proxmox_vm_qemu" "main" {
  # https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu

  # General
  target_node = var.target_node
  name        = var.name
  vmid        = var.vmid
  bios        = var.bios
  onboot      = var.onboot
  startup     = var.startup
  vm_state    = var.vm_state
  protection  = var.protection
  desc        = var.description
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

  # Hard Disk
  # disks (required)
  disks {
    # scsi disks (required)
    scsi {
      # disk0 (required)
      dynamic "scsi0" {
        for_each = var.disks.scsi.scsi0.disk[*]
        iterator = each
        content {
          disk {
            backup     = each.value.backup
            cache      = each.value.cache
            emulatessd = each.value.emulatessd
            format     = each.value.format
            iothread   = each.value.iothread
            replicate  = each.value.replicate
            size       = each.value.size
            storage    = each.value.storage
            discard    = each.value.discard
          }
        }
      }

      # disk1 (optional)
      dynamic "scsi1" {
        for_each = var.disks.scsi.scsi1.disk[*]
        iterator = each
        content {
          disk {
            backup     = each.value.backup
            cache      = each.value.cache
            emulatessd = each.value.emulatessd
            format     = each.value.format
            iothread   = each.value.iothread
            replicate  = each.value.replicate
            size       = each.value.size
            storage    = each.value.storage
            discard    = each.value.discard
          }
        }
      }

      # disk2 (optional)
      dynamic "scsi2" {
        for_each = var.disks.scsi.scsi2.disk[*]
        iterator = each
        content {
          disk {
            backup     = each.value.backup
            cache      = each.value.cache
            emulatessd = each.value.emulatessd
            format     = each.value.format
            iothread   = each.value.iothread
            replicate  = each.value.replicate
            size       = each.value.size
            storage    = each.value.storage
            discard    = each.value.discard
          }
        }
      }

      # disk3 (optional)
      dynamic "scsi3" {
        for_each = var.disks.scsi.scsi3.disk[*]
        iterator = each
        content {
          disk {
            backup     = each.value.backup
            cache      = each.value.cache
            emulatessd = each.value.emulatessd
            format     = each.value.format
            iothread   = each.value.iothread
            replicate  = each.value.replicate
            size       = each.value.size
            storage    = each.value.storage
            discard    = each.value.discard
          }
        }
      }

      # init-cloud drive (optional)
      dynamic "scsi10" {
        for_each = var.disks.scsi.scsi10.cloudinit[*]
        iterator = each
        content {
          cloudinit {
            storage = each.value.storage
          }
        }
      }
    }
  }

  # Cloud-Init
  cicustom     = var.cloud_init.cicustom
  ciuser       = var.cloud_init.ciuser
  ci_wait      = var.cloud_init.ci_wait
  cipassword   = var.cloud_init.cipassword
  searchdomain = var.cloud_init.searchdomain
  nameserver   = var.cloud_init.nameserver
  sshkeys      = var.cloud_init.sshkeys
  ipconfig0    = var.cloud_init.ipconfig0
  ipconfig1    = var.cloud_init.ipconfig1
  ipconfig2    = var.cloud_init.ipconfig2
  ipconfig3    = var.cloud_init.ipconfig3
  ipconfig4    = var.cloud_init.ipconfig4
  ipconfig5    = var.cloud_init.ipconfig5
  ipconfig6    = var.cloud_init.ipconfig6
  ipconfig7    = var.cloud_init.ipconfig7
  ipconfig8    = var.cloud_init.ipconfig8
  ipconfig9    = var.cloud_init.ipconfig9
  ipconfig10   = var.cloud_init.ipconfig10
  ipconfig11   = var.cloud_init.ipconfig11
  ipconfig12   = var.cloud_init.ipconfig12
  ipconfig13   = var.cloud_init.ipconfig13
  ipconfig14   = var.cloud_init.ipconfig14
  ipconfig15   = var.cloud_init.ipconfig15

  lifecycle {
    create_before_destroy = true

    ignore_changes = [target_node]
  }
}
