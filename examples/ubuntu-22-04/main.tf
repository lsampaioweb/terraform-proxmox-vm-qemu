terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://kvm.homelab:8006/api2/json"
  pm_api_token_id = "terraform@pve!terraform"
}

module "proxmox_vm" {
  source  = "lsampaioweb/vm-qemu/proxmox"

  target_node = "kvm-01"
  clone       = "ubuntu-22-04-server-std-docker"
  name        = "stg-load-balancer-01"
  onboot      = true
  startup     = "order=1"
  vcpus       = 3
  description = "Traefik VM as Load Balancer - Staging."
  pool        = "Staging"
}

output "virtual_machines" {
  value = module.proxmox_vm
  description = "Some information about the VM."
}
