output "clone" {
  value       = proxmox_vm_qemu.main.clone
  description = "The template that the VM was cloned from."
}

output "cores" {
  value       = proxmox_vm_qemu.main.cores
  description = "The number of CPU cores allocated to the VM."
}

output "cpu" {
  value       = proxmox_vm_qemu.main.cpu
  description = "The type of CPU model used by the VM."
}

output "description" {
  value       = proxmox_vm_qemu.main.desc
  description = "A description of the VM."
}

output "id" {
  value       = proxmox_vm_qemu.main.id
  description = "The ID of the VM."
}

output "ipv4" {
  value       = proxmox_vm_qemu.main.default_ipv4_address
  description = "The primary IPv4 address assigned to the VM."
}

output "memory" {
  value       = proxmox_vm_qemu.main.memory
  description = "The amount of RAM (in MB) allocated to the VM."
}

output "name" {
  value       = proxmox_vm_qemu.main.name
  description = "The name of the VM."
}

output "network_info" {
  value = [
    for net in proxmox_vm_qemu.main.network : {
      bridge    = net.bridge
      firewall  = net.firewall
      macaddr   = net.macaddr
      model     = net.model
      tag       = net.tag
    }
  ]
  description = "The network interfaces of the VM, including bridge, firewall status, MAC address, model, and VLAN tag."
}

output "pool" {
  value       = proxmox_vm_qemu.main.pool
  description = "The resource pool to which the VM belongs."
}

output "protection" {
  value       = proxmox_vm_qemu.main.protection
  description = "Whether the VM is protected against accidental removal."
}

output "startup" {
  value       = proxmox_vm_qemu.main.startup
  description = "Startup options for the VM, such as boot order and delay."
}

output "target_node" {
  value       = proxmox_vm_qemu.main.target_node
  description = "The Proxmox node that hosts the VM."
}

output "vcpus" {
  value       = proxmox_vm_qemu.main.vcpus
  description = "The number of virtual CPUs (vCPUs) allocated to the VM."
}
