terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://kvm.lan.homelab:8006/api2/json"
  pm_api_token_id = "terraform@pve!terraform"

  # pm_log_enable = true
  # pm_log_file   = "terraform-proxmox.log"
  # pm_log_levels = {
  #   _default    = "debug"
  #   _capturelog = ""
  # }
}
