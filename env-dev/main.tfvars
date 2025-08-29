env                          = "dev"
instance_type                = "t2.micro"
zone_id                      = "Z08520602FC482APPVUI7"
vault_token                  = "hvs.T8WnPWmYmGZkPYlGAHXVmebk"
vpc_cidr_block               = "10.0.0.0/24"
subnet_cidr_block            = "10.0.0.0/24"
default_vpc_id               = "vpc-02a94ee8944923438"
default_vpc_cidr_block       = "172.31.0.0/16"
vpc_route_table_id           = "rtb-0f21a72d871b42e59"
default_vpc_route_table_id   = "rtb-0a2e9ff93585c96fd"
frontendServers              = ["10.0.0.0/27","10.0.0.32/27"]
backendServers               = ["10.0.0.64/27","10.0.0.96/27"]
dbServers                    = ["10.0.0.128/27","10.0.0.160/27"]
publicServers                = ["10.0.0.192/27","10.0.0.224/27"]
availability_zone            = ["us-east-1a","us-east-1b"]
bastion_node                 = ["172.31.37.68/32"]
certificate_arn              = "arn:aws:acm:us-east-1:041445559784:certificate/15f6ea3c-b316-4933-a3b7-3bc71ce13c90"
ssl_policy                   = "ELBSecurityPolicy-TLS13-1-3-2021-06"
kms_key_id                    = "arn:aws:kms:us-east-1:041445559784:key/afa24bbe-ec87-4e41-b04f-0fc44209e137"
volume_type                  = "gp3"


docdb = {
  main = {
    cluster_identifier      =  "docdb-cluster"
    engine                  =  "docdb"
    engine_version          =  "4.0.0"
    family                  =  "docdb4.0"
    instance_class          =  "db.t3.medium"
    env                     =  "dev"
    kms_key_id              =  "arn:aws:kms:us-east-1:041445559784:key/afa24bbe-ec87-4e41-b04f-0fc44209e137"
  }
}

rabbitmq = {
  main = {
    component     = "rabbitmq"
    instance_type = "t3.micro"
  }
}

rds = {
  main = {
    db_name              =  "mysql"
    instance_class       =  "db.m5.large"
    allocated_storage    =  20
    engine               =  "MySQL"
    engine_version       =  "5.7.44"
    family               =  "mysql5.7"
  }
}

redis = {
  main = {
    cluster_id      = "redis"
    engine          = "redis"
    engine_version  = "6.2"
    node_type       = "cache.t4g.micro"
    num_cache_nodes = 1
    family          = "redis6.x"
  }
}
