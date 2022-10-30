variable "hastate" {
  description = "Requested HA state for the resource. One of 'started', 'stopped', 'enabled', 'disabled', or 'ignored'. See the docs about HA for more info."
  type        = string
  default     = ""
}

variable "hagroup" {
  description = "The HA group identifier the resource belongs to (requires hastate to be set!)."
  type        = string
  default     = ""
}
