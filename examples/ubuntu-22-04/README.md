This is just a small code example.

Create the terraform block with the required providers:
```terraform
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

# Add the url (or ip) of your Proxmox:
provider "proxmox" {
  pm_api_url      = "https://kvm.homelab:8006/api2/json"
  pm_api_token_id = "terraform@pve!terraform"
}
```

Create the module block with your own values, these are just a few of them:
```terraform
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
```

The output will display the id, name, ipv4, mac address and other information about the VM.
```terraform
output "virtual_machines" {
  value = module.proxmox_vm
}
```

# License:

[MIT](LICENSE "MIT License")

# Created by: 

1. Luciano Sampaio.
