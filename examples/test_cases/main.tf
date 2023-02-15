module "project" {
  source = "../.."

  for_each = var.test_cases

  # General
  target_node = each.value.target_node
  name        = each.value.name
  vmid        = each.value.vmid
  description = each.value.description
  bios        = each.value.bios
  onboot      = each.value.onboot
  startup     = each.value.startup
  oncreate    = each.value.oncreate
  pool        = each.value.pool

  # Clone
  os_type      = each.value.os_type
  clone        = each.value.clone
  full_clone   = each.value.full_clone
  force_create = each.value.force_create

  # OS
  tablet  = each.value.tablet
  boot    = each.value.boot
  agent   = each.value.agent
  qemu_os = each.value.qemu_os
  numa    = each.value.numa
  hotplug = each.value.hotplug
  scsihw  = each.value.scsihw
  tags    = each.value.tags
  vga     = each.value.vga

  # CPU
  cpu     = each.value.cpu
  sockets = each.value.sockets
  cores   = each.value.cores
  vcpus   = each.value.vcpus

  # Memory
  memory  = each.value.memory
  balloon = each.value.balloon

  # Hard Disk  
  disks = each.value.disks

  # Networks
  networks = each.value.networks

  # High Availability
  hagroup = each.value.hagroup
  hastate = each.value.hastate
}
