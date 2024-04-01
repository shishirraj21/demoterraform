# resource "aws_instance" "web" {
#   ami         ="ami-05295b6e6c790593e"
#   instance_type = "t2.micro"
#   count = 3
#   tags = {
#     env = var.env_name[count.index]
#     Name = "myinstance-${count.index+1}"
#   }
# }

#conditional expression.. var.varname == true ? number if true:number if false

resource "aws_instance" "dev" {
  ami         ="ami-05295b6e6c790593e"
  instance_type = "t2.micro"
  count = var.is_dev_evn == true ? 2:0 #conditional expression
  tags = {
    name = var.instance_name[count.index]    
  }
}

resource "aws_instance" "prod" {
  ami         ="ami-05295b6e6c790593e"
  instance_type = "t2.micro"
  count = var.is_prod_env == true ? 3:0
   tags = {
    name= "prod-${count.index+1}"
}
}

