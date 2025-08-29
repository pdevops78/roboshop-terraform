resource "aws_instance" "component" {
   ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  subnet_id =  var.subnet_id[0]

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }
  root_block_device {
    encrypted    = true
    kms_key_id   = var.kms_key_id
    volume_type  = var.volume_type
  }
  tags = {
    Name = "${var.component}-${var.env}"
  }
}

resource "aws_route53_record" "server_route" {
  name               = "${var.component}-${var.env}.pdevops78.online"
  type               = "A"
  zone_id            = var.zone_id
  records            = [aws_instance.component.private_ip]
  ttl                = 30
}

resource "aws_security_group" "sg" {
  name                 =   "${var.env}-rds-sg"
  description          =   "${var.env}-rds-sg"
  vpc_id               =   var.vpc_id
  ingress {
    from_port        =     5672
    to_port          =     5672
    protocol         =    "tcp"
    cidr_blocks      =    var.bastion_node
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

