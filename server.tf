# Configure the AWS Provider
provider "aws" {
 access_key = "${var.access_key}"
 secret_key = "${var.secret_key}"
 region = "us-west-2"
}
# Configure Security group
 resource "aws_security_group" "default" {
 name = "aws_default"
 description = "Default security group"
 # inbound access from anywhere
 ingress {
 from_port = 0
 to_port = 65535
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
 }
 # outbound internet access
 egress {
 from_port = 0
 to_port = 0
 protocol = "-1"
 cidr_blocks = ["0.0.0.0/0"]
 }
}
# define the authentication key that will be deployed to servers
resource "aws_key_pair" "auth" {
 key_name = "key"
 public_key = "ssh-rsa xxxxxxxx"
}
# Create load balancer
resource "aws_instance" "lb" {
 connection {
 user = "ubuntu"
 }
 instance_type = "t2.micro"
 tags {
 Name = "lb1"
 Group = "lbs"
 }
 security_groups = ["aws_default"]
 ami = "ami-5189a661"
 key_name = "key"
}
# Create apps
resource "aws_instance" "app1" {
 connection {
 user = "ubuntu"
 }
 instance_type = "t2.micro"
 tags {
 Name = "app1"
 Group = "apps"
 }
 security_groups = ["aws_default"]
 ami = "ami-5189a661"
 key_name = "key"
}
resource "aws_instance" "app2" {
 connection {
 user = "ubuntu"
 }
 instance_type = "t2.micro"
 tags {
 Name = "app2"
 Group = "apps"
 }
 security_groups = ["aws_default"]
 ami = "ami-5189a661"
 key_name = "key"
}
resource "aws_instance" "app3" {
 connection {
 user = "ubuntu"
 }
 instance_type = "t2.micro"
 tags {
 Name = "app3"
 Group = "apps"
 }
 security_groups = ["aws_default"]
 ami = "ami-5189a661"
 key_name = "key"
}
resource "aws_instance" "app4" {
 connection {
 user = "ubuntu"
 }
 instance_type = "t2.micro"
 tags {
 Name = "app4"
 Group = "apps"
 }
 security_groups = ["aws_default"]
 ami = "ami-5189a661"
 key_name = "key"
}
# create db
resource "aws_instance" "db1" {
 connection {
 user = "ubuntu"
 }
 instance_type = "t2.micro"
 tags {
 Name = "db1"
 Group = "dbs"
 }
 security_groups = ["aws_default"]
 ami = "ami-5189a661"
 key_name = "key"
}
# Create Consul
resource "aws_instance" "consul" {
 connection {
 user = "ubuntu"
 }
 instance_type = "t2.micro"
 tags {
 Name = "consul"
 Group = "consul"
 }
 security_groups = ["aws_default"]
 ami = "ami-5189a661"
 key_name = "key"
}
