variable "azure_region" {
  type    = string
  default = "East US"
}

variable "ssh_key_path" {
  type        = string
  description = "SSH key local path"
}
