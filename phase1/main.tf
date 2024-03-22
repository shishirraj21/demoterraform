data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
# resource "aws_security_group" "web_sg" {
  
# }
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data = file("${path.module}/script.sh")
   #security_groups = "launch-wizard-1"
  # security_groups = [ "launch-wizard-1", ]
  #vpc_security_group_ids = [  ]
   key_name = data.aws_key_pair.my_key_pair.key_name
  tags = {
    Name = "webapp-nginx-1"
  }
}

output "key_name" {
  value = aws_instance.web.key_name
}

output "security_groups" {
  value = aws_instance.web.security_groups
}
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_instance.web.subnet_id,"subnet-08b39b17fa027e1e9"]  # Assuming you have a public subnet
  security_groups    = ["sg-0a5252202d879cede"]

  tags = {
    Name = "My ALB"
  }
}
output "subnets" {
    value = aws_instance.web.subnet_id
  
}
resource "aws_lb_target_group" "my_tg1" {
  name        = "my-nginx-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "vpc-09a8c90cee623b0b5"  # Assuming you have already defined your VPC
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "my_tg_attachment" {
  target_group_arn = aws_lb_target_group.my_tg1.arn
  target_id        = aws_instance.web.id
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg1.arn
  }
}
#resource "aws_instance" "web1" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"
#   user_data = file("${path.module}/script1.sh")
#    #security_groups = "launch-wizard-1"
#   # security_groups = [ "launch-wizard-1", ]
#   #vpc_security_group_ids = [  ]
#    key_name = "new150324-mumbai"
#   tags = {
#     Name = "webapp-nignx-2"
#   }
# }


# functions 
# for loop 
# for_each --> map , list 
# count 
# file
# if else




