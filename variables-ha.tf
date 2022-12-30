variable "hagroup" {
  description = "The HA group identifier the resource belongs to (requires hastate to be set!)."
  type        = string
  default     = "default"
}

variable "hastate" {
  description = "Requested HA state for the resource. Options: started, stopped, enabled, disabled, or ignored."
  type        = string
  default     = "started"

  validation {
    condition     = contains(["started", "stopped", "enabled", "disabled", "ignored"], var.hastate)
    error_message = "Valid values are started, stopped, enabled, disabled, or ignored."
  }
}
