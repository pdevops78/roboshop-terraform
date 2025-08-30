data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = [973714476881]
}
# // this data will retrieve in json format
# data "vault_generic_secret" "get_secrets" {
#   path = "common/elastisearch"
# }

data "aws_security_group" "sg" {
  name = "allow-all"
}


#  centos  ----->   Centos-8-DevOps-Practice
#  AMI Location  ----->  973714476881/Centos-8-DevOps-Practice