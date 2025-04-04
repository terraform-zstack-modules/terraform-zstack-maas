#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}


# 应用配置变量
variable "image_name" {
  description = "Name for the log server image"
  type        = string
  default     = "maas-by-terraform"
}

variable "image_url" {
  description = "URL to download the image from"
  type        = string
  default     = "http://minio.zstack.io:9000/packer/redis-by-packer-image-compressed.qcow2"
}

variable "backup_storage_name" {
  description = "Name of the backup storage to use"
  type        = string
  default     = "bs"
}

variable "instance_name" {
  description = "Name for the cas server instance"
  type        = string
  default     = "maas"
}

variable "l3_network_name" {
  description = "Name of the L3 network to use"
  type        = string
  default     = "test"
}

variable "instance_offering_name" {
  description = "Name of the instance offering to use"
  type        = string
  default     = "min"
}

variable "ssh_user" {
  description = "SSH username for remote access"
  type        = string
  default     = "root"
}

variable "ssh_password" {
  description = "SSH password for remote access"
  type        = string
  default     = "password"
  sensitive   = true
}

variable "model_center_port" {
  description = "Model center management port"
  type        = number
  default     = 5000
}

variable "backend_endpoint" {
  description = "Backend endpoint"
  type        = string
}

variable "s3_backend_access_key" {
  description = "Backend access key"
  type        = string
}

variable "s3_backend_secret_key" {
  description = "Backend secret key"
  type        = string
}


variable "backend_type" {
  description = "Backend type"
  type        = string
  validation {
    condition     = contains(["nfs", "s3"], var.backend_type)
    error_message = "Backend type must be 'nfs' or 's3'."
  }
}


