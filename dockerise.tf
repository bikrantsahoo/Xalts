provider "aws" {
  region = "us-west-1"
}

resource "aws_security_group" "api_sg" {
  name        = "api-security-group"
  description = "Security group for the API"
  
  ingress {
    from_port   = 22 
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "api_instance" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"             
  key_name      = "My-key-pair"  
  security_groups = [aws_security_group.api_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              service docker start
              docker run -d -p 80:80 {api-docker-image}
              EOF

  tags = {
    Name = "api-instance"
  }
}
output "public_ip" {
  value = aws_instance.api_instance.public_ip
}
