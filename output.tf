output "vm_target_node" {
  value = proxmox_vm_qemu.main.target_node
}

output "vm_id" {
  value = proxmox_vm_qemu.main.id
}

output "vm_name" {
  value = proxmox_vm_qemu.main.name
}

output "vm_ipv4" {
  value = proxmox_vm_qemu.main.default_ipv4_address
}

output "vm_macaddr" {
  value = proxmox_vm_qemu.main.network[0].macaddr
}

output "vm_cloned_from" {
  value = proxmox_vm_qemu.main.clone
}
