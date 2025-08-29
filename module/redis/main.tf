resource "aws_elasticache_cluster" "example" {
  cluster_id           = "${var.cluster_id}-${var.env}"
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = ""
  tags = {
    Name = "${var.cluster_id}-${var.env}"
  }
}
resource "aws_elasticache_parameter_group" "pg" {
  name        = "${var.cluster_id}-${var.env}-pg"
  family      =  var.family
  tags  = {
    Name     = "${var.cluster_id}-${var.env}-pg"
  }
}
resource "aws_elasticache_subnet_group" "sg" {
  name       = "${var.cluster_id}-${var.env}-sg"
  subnet_ids = var.subnet_id
  tags = {
    Name     = "${var.cluster_id}-${var.env}-sg"
  }
}




