output "id" {
  value       = proxmox_vm_qemu.main.id
  description = "The ID of the VM."
}

output "name" {
  value       = proxmox_vm_qemu.main.name
  description = "The name of the VM."
}

output "clone" {
  value       = proxmox_vm_qemu.main.clone
  description = "The template that the VM was cloned from."
}

output "macaddr" {
  value       = proxmox_vm_qemu.main.network[*].macaddr
  description = "The networks of the VM."
}

output "ipv4" {
  value       = proxmox_vm_qemu.main.default_ipv4_address
  description = "The IPV4 of the VM."
}

output "target_node" {
  value       = proxmox_vm_qemu.main.target_node
  description = "The Proxmox node that received the VM."
}
