module  "components"{
source           =   "./module/app"
app_components   =   var.components
instance_type    =   "t2.micro"
env              =    "dev"
zone_id          =   "Z08520602FC482APPVUI7"
}

module "docdb"{
source             =    "./module/docdb"
cluster_identifier =    "docdb-cluster"
engine             =    "docdb"
engine_version     =    "4.0.0"
family             =    "docdb4.0"
subnet_id          =     var.dbServers
server_app_ports   =     module.VPC.backendServers
env                =     "dev"
docdb_username     =     "docdb"
docdb_password     =     "roboshop123"
}

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