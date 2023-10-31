terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "leonardo-universion1-key"
  user_data     = <<-EOF
                 #!/bin/bash
                 cd /home/ubuntu
                 echo "<h1>Ola mundo com o Terraform</h1>" > index.html
                 nohup busybox httpd -f -p 8080 &
                 EOF
  tags = {
    Name = "Universion-terraform"
  }
}
