provider "aws" {
  region  = "ap-south-1"
  shared_credentials_files  = ["/root/.aws/credentials"]
}


resource "aws_instance" "ec2_example" {

    ami = "ami-02b49a24cfb95941c"  
    instance_type = "t2.micro"
    tags = {
	Name = "Terraform EC2"
	}
    provisioner "local-exec" {
      command = " touch hello.txt"
	}
}
