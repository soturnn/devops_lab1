variable "profile" {
     default = "terraform_iam_user" 
     }
variable "region" { 
    default = "us-east-1"
    }
variable "instance" { 
    default = "t2.micro" 
    } 
variable "instance_count" { 
    default = "1" 
    }  
variable "private_key" { 
    default = "~/lab1/terraform/jenkins/key/aws_key_pair.pem" 
    } 
variable "ansible_user" {
    default = "ubuntu" 
    } 