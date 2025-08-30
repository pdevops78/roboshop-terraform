resource "aws_instance" "component" {
  count = length(var.app_components)
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.sg.id]
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




