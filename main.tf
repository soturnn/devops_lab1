provider "aws" {
  profile = "default"
  region  = "${var.region}"
  access_key = 
  secret_key = 
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "${var.instance}"
  key_name = "aws_key_pair"
  vpc_security_group_ids = ["${aws_security_group.web_security_group.id}"]
 
  tags = {
    Name = "AppServerInstance"
  }

}

resource "aws_instance" "jenkins-ci" {
    count = "${var.instance_count}" 
    ami = data.aws_ami.ubuntu.id
    instance_type = "${var.instance}"
    key_name = "aws_key_pair" 
    vpc_security_group_ids = ["${aws_security_group.web_security_group.id}"]
     
    tags = {
     Name = "JenkinsServer"
    }

}


resource "aws_security_group" "web_security_group"{
        name = "My Security Group"

        ingress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]

        }

        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }

}

