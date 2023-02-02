output "vm_target_node" {
  value       = proxmox_vm_qemu.main.target_node
  description = "The Proxmox node that received the VM."
}

output "vm_id" {
  value       = proxmox_vm_qemu.main.id
  description = "The ID of the VM."
}

output "vm_name" {
  value       = proxmox_vm_qemu.main.name
  description = "The name of the VM."
}

output "vm_ipv4" {
  value       = proxmox_vm_qemu.main.default_ipv4_address
  description = "The IPV4 of the VM."
}

output "vm_macaddr" {
  value       = proxmox_vm_qemu.main.network[0].macaddr
  description = "The Macaddress of the VM."
}

output "vm_cloned_from" {
  value       = proxmox_vm_qemu.main.clone
  description = "The template that the VM was cloned from."
}
