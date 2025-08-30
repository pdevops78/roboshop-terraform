module  "components"{
  source           =   "./module/app"
  app_components   =   var.components
  instance_type    =   var.instance_type
  env              =   var.env
  zone_id          =   var.zone_id
  subnet_id        =   module.VPC.backend
  vpc_id           = module.VPC.vpc_id
}
module "docdb" {
  for_each            =    var.docdb
  source             =    "./module/docdb"
  cluster_identifier =    each.value["cluster_identifier"]
  engine             =    each.value["engine"]
  engine_version     =    each.value["engine_version"]
  family             =    each.value["family"]
  instance_class      =   each.value["instance_class"]
  subnet_ids          =    module.VPC.backend
  server_app_ports   =    var.dbServers
  env                =    each.value["env"]
  docdb_username     =    "docdb"
  docdb_password     =    "roboshop123"
  kms_key_id         =    each.value["kms_key_id"]
  vpc_id             =    module.VPC.vpc_id
  instance_count     =   each.value["instance_count"]
}
# module "rds" {
#   source                = "./module/rds"
#   for_each              = var.rds
#   allocated_storage     = each.value["allocated_storage"]
#   component             = each.value["db_name"]
#   engine                = each.value["engine"]
#   engine_version        = each.value["engine_version"]
#   env                   = var.env
#   family                = each.value["family"]
#   instance_class        = each.value["instance_class"]
#   kms_key_id            = var.kms_key_id
#   server_app_ports      = var.dbServers
#   subnet_id             = module.VPC.backend
#   vpc_id                = module.VPC.vpc_id
#   multi_az              = false
#   publicly_accessible   = false
#   skip_final_snapshot   = true
#   storage_type          = true
# }
module "redis"{
  source           = "./module/redis"
  for_each         = var.redis
  cluster_id       = each.value["cluster_id"]
  engine           = each.value["engine"]
  engine_version   = each.value["engine_version"]
  server_app_ports  = var.dbServers
  env              = var.env
  node_type        = each.value["node_type"]
  num_cache_nodes  = each.value["num_cache_nodes"]
  family           = each.value["family"]
  subnet_id        = module.VPC.backend
  vpc_id           = module.VPC.vpc_id
}
# # module "rabbitmq"{
# #   source           = "./module/rabbitmq"
# #   for_each         = var.rabbitmq
# #   component        = each.value["component"]
# #   env              = var.env
# #   instance_type    = each.value["instance_type"]
# #   zone_id          = var.zone_id
# #   bastion_node    = var.bastion_node
# #   vpc_id           = module.VPC.vpc_id
# #   subnet_id        = var.dbServers
# #   kms_key_id       = var.kms_key_id
# #   volume_type      = var.volume_type
# # }
module "VPC"{
  source                       = "./module/VPC"
  env                          = var.env
  vpc_cidr_block               = var.vpc_cidr_block
  frontendServers              = var.frontendServers
  availability_zone            = var.availability_zone
  default_vpc_id               = var.default_vpc_id
  default_vpc_cidr_block       = var.default_vpc_cidr_block
  default_vpc_route_table_id   = var.default_vpc_route_table_id
  publicServers                = var.publicServers
  dbServers                    = var.dbServers
  backendServers               = var.backendServers
}