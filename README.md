<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_zstack"></a> [zstack](#requirement\_zstack) | 1.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_maas_image"></a> [maas\_image](#module\_maas\_image) | git::https://github.com/terraform-zstack-modules/terraform-zstack-image.git | n/a |
| <a name="module_maas_instance"></a> [maas\_instance](#module\_maas\_instance) | git::https://github.com/chijiajian/terraform-zstack-instance.git | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ./modules/redis | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_data.install_model_center](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_endpoint"></a> [backend\_endpoint](#input\_backend\_endpoint) | Backend endpoint | `string` | n/a | yes |
| <a name="input_backend_type"></a> [backend\_type](#input\_backend\_type) | Backend type | `string` | n/a | yes |
| <a name="input_backup_storage_name"></a> [backup\_storage\_name](#input\_backup\_storage\_name) | Name of the backup storage to use | `string` | `"bs"` | no |
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br/><br/>Examples:<pre>context:<br/>  project:<br/>    name: string<br/>    id: string<br/>  environment:<br/>    name: string<br/>    id: string<br/>  resource:<br/>    name: string<br/>    id: string</pre> | `map(any)` | `{}` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name for the log server image | `string` | `"maas-by-terraform"` | no |
| <a name="input_image_url"></a> [image\_url](#input\_image\_url) | URL to download the image from | `string` | `"http://minio.zstack.io:9000/packer/redis-by-packer-image-compressed.qcow2"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name for the cas server instance | `string` | `"maas"` | no |
| <a name="input_instance_offering_name"></a> [instance\_offering\_name](#input\_instance\_offering\_name) | Name of the instance offering to use | `string` | `"min"` | no |
| <a name="input_l3_network_name"></a> [l3\_network\_name](#input\_l3\_network\_name) | Name of the L3 network to use | `string` | `"test"` | no |
| <a name="input_model_center_port"></a> [model\_center\_port](#input\_model\_center\_port) | Model center management port | `number` | `5000` | no |
| <a name="input_s3_backend_access_key"></a> [s3\_backend\_access\_key](#input\_s3\_backend\_access\_key) | Backend access key | `string` | n/a | yes |
| <a name="input_s3_backend_secret_key"></a> [s3\_backend\_secret\_key](#input\_s3\_backend\_secret\_key) | Backend secret key | `string` | n/a | yes |
| <a name="input_ssh_password"></a> [ssh\_password](#input\_ssh\_password) | SSH password for remote access | `string` | `"password"` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | SSH username for remote access | `string` | `"root"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_all_node_ips"></a> [redis\_all\_node\_ips](#output\_redis\_all\_node\_ips) | The message from redis. |
| <a name="output_redis_primary_ip"></a> [redis\_primary\_ip](#output\_redis\_primary\_ip) | The message from redis. |
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->