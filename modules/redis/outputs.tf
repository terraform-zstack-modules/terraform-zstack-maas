#
# Contextual output
#

output "walrus_project_name" {
  value       = try(local.context["project"]["name"], null)
  description = "The name of project where deployed in Walrus."
}

output "walrus_project_id" {
  value       = try(local.context["project"]["id"], null)
  description = "The id of project where deployed in Walrus."
}

output "walrus_environment_name" {
  value       = try(local.context["environment"]["name"], null)
  description = "The name of environment where deployed in Walrus."
}

output "walrus_environment_id" {
  value       = try(local.context["environment"]["id"], null)
  description = "The id of environment where deployed in Walrus."
}

output "walrus_resource_name" {
  value       = try(local.context["resource"]["name"], null)
  description = "The name of resource where deployed in Walrus."
}

output "walrus_resource_id" {
  value       = try(local.context["resource"]["id"], null)
  description = "The id of resource where deployed in Walrus."
}


# 输出Redis集群信息
output "redis_primary_ip" {
  value = local.primary_ip
  description = "Redis主节点IP地址"
}

output "redis_replica_ips" {
  value = local.replica_ips
  description = "Redis从节点IP地址列表"
}

output "all_node_ips" {
  value = local.node_ips
  description = "所有Redis节点IP地址"
}

output "deployment_mode" {
  value = var.architecture
  description = "Redis部署模式 (standalone 或 replication)"
}

output "redis_password" {
 value = local.redis_password
}
