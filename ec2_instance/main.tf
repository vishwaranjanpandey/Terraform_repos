variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "enable_public_ip_address" {}
variable "public_key" {}
variable "sg_id" {}
variable "subnet_id" {}


output "jenkins_ec2_instance_ip" {
 value = aws_instance.jenkins_ec2_instance.id
}

resource "aws_instance" "jenkins_ec2_instance" {
  ami              = var.ami_id
  instance_type    = var.instance_type 
  tags  = {
	Name = var.tag_name
	}
  key_name         = "aws_key_pair"
  subnet_id        = var.subnet_id 
  vpc_security_group_ids = [var.sg_id] 
  associate_public_ip_address  = var.enable_public_ip_address
 }


resource "aws_key_pair" "jenkins_ec2_keypair" {
 key_name = "aws_key_pair"
 public_key = var.public_key
}
