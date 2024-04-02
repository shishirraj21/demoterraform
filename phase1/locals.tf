#variables used when a value is used multiple times in the code but can be changed in future as per need
#there we define it as variables.difference btw local and variable is its not used for single 
#value but used for whole expression which is used ultiple times in the code.example-tags
resource "aws_ebs_volume" "localdemo" {
  availability_zone = "ap-south-1"
  size              = 40

  tags = {
    Name = "devops"
    purpose="monitoring"
  }
}

locals {
  common_tag ={
    Name = "devops"
    purpose = "monitoring"}
}

resource "aws_instance" "localdemo" {
  ami = "ami-1234567890"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1"

  tags = local.common_tag
  
}