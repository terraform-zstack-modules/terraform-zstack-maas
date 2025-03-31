locals {
  context = var.context
}

module "redis" {
  source = "./modules/redis"
}

module "maas_image" {
  source = "git::https://github.com/terraform-zstack-modules/terraform-zstack-image.git"

  create_image        = true
  image_name          = var.image_name
  image_url           = var.image_url
  guest_os_type      = "Centos 7"
  platform           = "Linux"
  format             = "qcow2"
  architecture       = "x86_64"

  backup_storage_name = var.backup_storage_name
}

module "maas_instance" {
  source = "git::https://github.com/chijiajian/terraform-zstack-instance.git"

  name                  = var.instance_name
  description           = "maas Server Created by Terraform"
  instance_count        = 1
  image_uuid            = module.maas_image.image_uuid
  l3_network_name       = var.l3_network_name
  instance_offering_name = var.instance_offering_name
}

locals {
    redis_config_ips =  join(",", [for ip in module.redis.all_node_ips : format("%s:%d", ip, 5666)])  
    redis_connection_string = format(
    "redis://:%s@%s,%s/%d",
    module.redis.redis_password,
    module.redis.redis_primary_ip,
    join(",", [for ip in module.redis.all_node_ips : format("%s:%d", ip, 5666)]),
    0
  )
}

resource "terraform_data" "install_model_center" {
  depends_on = [module.maas_instance, module.redis]
  connection {
    type     = "ssh"
    user     = local.ssh_user
    password = local.ssh_password
    host     = module.maas_instance.instance_ips[0]
    timeout  = "15m"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /tmp/aios_install/"
    ]
  }

  provisioner "file" {
    source      = "./install.py"
    destination = "/tmp/aios_install/install.py"
  }

/*
  provisioner "remote-exec" {
    inline = [
      "python3 /tmp/aios_install/install.py --redis-hosts \"${local.redis_config_ips}\" --backend-type \"${var.backend_type}\" --backend-endpoint \"${var.backend_endpoint}\" --backend-access-key \"${var.s3_backend_access_key}\" --backend-secret-key \"${var.s3_backend_secret_key}\""
    ]
  }
 */
}