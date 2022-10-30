variable "api_url" {
  description = "URL to the Proxmox API, including the full path. https://<server>:<port>/api2/json"
  type        = string
  default     = "https://kvm.homelab:8006/api2/json"
}

variable "api_token_id" {
  description = "Username when authenticating to Proxmox, including the realm. For example user@pve to use the local Proxmox realm. When used with token, it would look like this: user@pve!TokenName"
  type        = string
  default     = "terraform@pve!terraform"
}
