output "vm_id" {
  value = proxmox_vm_qemu.main.*.id
}

output "vm_name" {
  value = proxmox_vm_qemu.main.*.name
}

output "ipv4" {
  value = proxmox_vm_qemu.main.*.default_ipv4_address
}
