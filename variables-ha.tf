variable "hagroup" {
  description = "The HA group identifier the resource belongs to (requires hastate to be set!). Defaults to empty."
  type        = string
  default     = ""
  nullable    = false
}

variable "hastate" {
  description = "Requested HA state for the resource. Options: started, stopped, enabled, disabled, or ignored. Defaults to ignored."
  type        = string
  default     = "ignored"
  nullable    = false

  validation {
    condition     = contains(["started", "stopped", "enabled", "disabled", "ignored"], var.hastate)
    error_message = "Valid values are started, stopped, enabled, disabled, or ignored."
  }
}
