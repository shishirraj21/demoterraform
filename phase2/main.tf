# create VPC 
# resource "aws_vpc" "my-vpc" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "AWS VPC"
#   }
# }
# output "vpc-id" {
#     value = aws_vpc.my-vpc.id
  
#}
# create subnet 
# resource "aws_subnet" "my-public-subnet-1" {
#   vpc_id     = aws_vpc.my-vpc.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "public subnet"
#   }
# }
# resource "aws_subnet" "my-private-subnet-1" {
#   vpc_id     = aws_vpc.my-vpc.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "private subnet"
#   }
#}
# create IGW
# resource "aws_internet_gateway" "my-igw" {
#   vpc_id = aws_vpc.my-vpc.id

#   tags = {
#     Name = "IGW"
#   }
# }
#ROUTE TABLE
# resource "aws_route_table" "my-route-1" {
#   vpc_id = aws_vpc.my-vpc.id

#    route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.my-igw.id
#    }


#   route {
#     ipv6_cidr_block        = "::/0"
#    # egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

#   tags = {
#     Name = "MY PUBLIC ROUTE "
#   }
# }
# resource "aws_route_table" "my-route-2" {
#   vpc_id = aws_vpc.my-vpc.id

#   route {
#     cidr_block = "10.0.2.0/24"
#   #  gateway_id = aws_internet_gateway.my-igw.id
#   }

  #route {
   # ipv6_cidr_block        = "::/0"
   # egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  

#   tags = {
#     Name = "MY PRIVATE ROUTE "
#   }
# }
#SUBNET ASSOCIATION
# resource "aws_route_table_association" "my-pub-sa" {
#   subnet_id      = aws_subnet.my-public-subnet-1.id
#   route_table_id = aws_route_table.my-route-1.id
# }
# resource "aws_route_table_association" "my-pri-sa" {
#   subnet_id      = aws_subnet.my-private-subnet-1.id
#   route_table_id = aws_route_table.my-route-2.id
# }
resource "aws_instance" "example" {
  count         = var.create_instances ? 3 : 0
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = "subnet-12345678"
  tags = {
    Name = "${var.create_instances ? "instance-${count.index + 1}" : ""}"
  }
}