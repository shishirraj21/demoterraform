variable "alb_name" {
  default = "my-alb"
}

variable "access_key" {
  
}

variable "secret_key" {
  
}

variable "env_name" {
  type = list(string)
  default = ["dev","test","prod"]    
  }
