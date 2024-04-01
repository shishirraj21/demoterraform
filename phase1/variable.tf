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

  variable "is_dev_evn" {
    type = bool
  }
  variable "instance_name" {
    type = list(string)
    default = [ "devsample","devdemo" ]
    
  }

  variable "is_prod_env" {
    type = bool
  }
