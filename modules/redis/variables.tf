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
  default     = "redis-by-terraform"
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
  default     = "redis"
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
  default     = "zstack"
}

variable "ssh_password" {
  description = "SSH password for remote access"
  type        = string
  default     = "ZStack@123"
  sensitive   = true
}

variable "non_production" {
  description = "Whether to run in non-production mode"
  type        = bool
  default     = false
}

variable "redis_password" {
  description = "Redis password"
  type        = string
  default     = "zstack.redis.password"
  sensitive   = true
}

variable "architecture" {
  description = <<-EOF
Specify the deployment architecture, select from standalone or replication.
EOF
  type        = string
  default     = "replication"
  validation {
    condition     = var.architecture == "" || contains(["standalone", "replication"], var.architecture)
    error_message = "Invalid architecture"
  }
}
