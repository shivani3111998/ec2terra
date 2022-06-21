#create ec2 instance 
resource "aws_instance" "instance1" {
ami = "ami-08df646e18b182346"
instance_type = "t2.micro"
subnet_id="${aws_subnet.private-subnet-1.id}"
vpc_security_group_ids = [aws_security_group.sgroup1.id,]
}


resource "aws_security_group" "sgroup1" {
vpc_id = aws_vpc.vp.id
ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}



egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}



ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}