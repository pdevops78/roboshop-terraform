resource "aws_instance" "component" {
  count = length(var.app_components)
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg[count.index].id]
  subnet_id  = var.subnet_id[0]
  instance_market_options {
      market_type = "spot"
      spot_options {
        instance_interruption_behavior = "stop"
        spot_instance_type             = "persistent"
      }
    }
    tags = {
    Name = "${var.app_components[count.index]}-${var.env}"
   }
 }

resource "aws_route53_record" "server_route" {
  count              = length(var.app_components)
  name               = "${var.app_components[count.index]}-${var.env}.pdevops78.online"
  type               = "A"
  zone_id            = var.zone_id
  records            = [aws_instance.component[count.index].private_ip]
  ttl                = 30
}

resource "aws_security_group" "sg" {
  count                =    length(var.app_components)
  name                 =    "${var.app_components[count.index]}-${var.env}"
  description          =    "Allow TLS inbound traffic and all outbound traffic"
  vpc_id               =    var.vpc_id
  ingress {
    from_port        =     0
    to_port          =     0
    protocol         =    "-1"
    cidr_blocks      =    ["0.0.0.0/0"]
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




