resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${var.cluster_identifier}-${var.env}"
  engine                  = var.engine
  engine_version          = var.engine_version
  master_username         = var.docdb_username
  master_password         = var.docdb_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  kms_key_id              = var.kms_key_id
  storage_encrypted       = true
  vpc_security_group_ids  = [aws_security_group.sg.id]
  db_subnet_group_name    = aws_docdb_subnet_group.subnet_group.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.pg.name
}

resource "aws_docdb_cluster_parameter_group" "pg" {
  family      = var.family
  name        = "${var.cluster_identifier}-${var.env}"
  description = "docdb cluster parameter group"
}

resource "aws_docdb_subnet_group" "subnet_group" {
  name       = "${var.cluster_identifier}-${var.env}"
  subnet_ids = var.subnet_id
  tags = {
    Name = "${var.cluster_identifier}-${var.env}"
  }
}
resource "aws_docdb_cluster_instance" "cluster_instances" {
  identifier         = "${var.cluster_identifier}-${var.env}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.instance_class
}
resource "aws_security_group" "sg" {
  name                 =    "${var.env}-custom-vpc-sg"
  description          =    "Allow TLS inbound traffic and all outbound traffic"
  vpc_id               =    var.vpc_id
   ingress {
      from_port        =     27017
      to_port          =     27017
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

