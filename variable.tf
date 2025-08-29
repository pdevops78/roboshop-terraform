variable "components"{
default = ["frontend","catalogue","user","cart","shipping","payment","dispatch"]
}
variable  "docdb"{}
variable  "env"{}
variable  "vpc_cidr_block"{}
variable  "frontendServers"{}
variable  "availability_zone"{}
variable  "default_vpc_id"{}
variable  "default_vpc_cidr_block"{}
variable  "default_vpc_route_table_id"{}
variable  "publicServers"{}
variable  "dbServers"{}
variable  "backendServers"{}
variable  "rds"{}
variable "redis"{}
variable "rabbitmq"{}
variable "zone_id"{}
variable "bastion_node"{}