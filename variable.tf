variable "instance_key" {
  description = "key pair name"
  type        = string
  default     = "new_key"
}

variable "master_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
