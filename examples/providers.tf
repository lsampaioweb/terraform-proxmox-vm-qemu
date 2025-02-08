terraform {
  required_providers {
    proxmox = {
      # https://registry.terraform.io/providers/Telmate/proxmox/latest
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://edge-pve-01.lan.homelab:8006/api2/json"
  pm_api_token_id = "terraform@pve!terraform"

  # pm_log_enable = true
  # pm_log_file   = "terraform-proxmox.log"
  # pm_log_levels = {
  #   _default    = "debug"
  #   _capturelog = ""
  # }
}
