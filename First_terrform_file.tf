provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-2"
}

resource "was_vpc" "myprivatezone"{
    cidr_block = "10.0.1.0/16"
}

resouces "aws_instance" "ubuntu" {
    ami = ""
    vpc = was_vpc.myprivatezone.id
    instance_type = "t2.micro"
    key_type = ""
    availability_zone = "us-east-2a"

    user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install httpd -y
    systemctl enable httpd
    systemctl start httpd
    echo "my first server" > /var/www/html/index.html
    EOF

    tags = {
        name = "myserver"
    }
}

resource "aws_internet_gateway" "mygw" {
  vpc_id = aws_vpc.myprivatezone.id

  tags = {
    Name = "mygwbig"
  }
}
