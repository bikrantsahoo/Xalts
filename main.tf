provider "aws" {
  region = "us-west-1" 
}

resource "aws_security_group" "api_sg" {
  name        = "api-security-group"
  description = "Security group for the API"

  ingress {
    from_port   = 22 # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80 # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080 
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "api_instance" {
  ami           = "ami-0c55b159cbfafe1f0" #Ubuntu AMI ID
  instance_type = "t2.micro"             # instance type
  key_name      = "My-key-pair"   #  key pair name
  security_groups = [aws_security_group.api_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io
    service docker start
    docker run -d -p 8080:80 api-docker-image 
    EOF
}

# Output the public IP address of the EC2 instance
output "public_ip" {
  value = aws_instance.api_instance.public_ip
}
