resource "aws_elasticache_cluster" "example" {
  cluster_id           = "${var.cluster_id}-${var.env}"
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = aws_elasticache_parameter_group.pg.name
  subnet_group_name    = aws_elasticache_subnet_group.sg.name
  security_group_ids   = [aws_security_group.sg.id]
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

resource "aws_security_group" "sg" {
  name                 =  "${var.cluster_id}-${var.env}-sg"
  description          =  "${var.cluster_id}-${var.env}-sg"
  vpc_id               =  var.vpc_id
  ingress {
    from_port        =     6379
    to_port          =     6379
    protocol         =    "tcp"
    cidr_blocks      =    var.server_app_ports
  }
  egress {
    from_port        =     0
    to_port          =     0
    protocol         =    "-1"
    cidr_blocks      =    ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-sg"
  }
}



