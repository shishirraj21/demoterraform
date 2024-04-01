resource "aws_instance" "web" {
  ami         ="ami-05295b6e6c790593e"
  instance_type = "t2.micro"
  count = 3
  tags = {
    env = var.env_name[count.index]
    Name = "myinstance-${count.index+1}"
  }
}
