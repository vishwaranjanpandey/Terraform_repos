provider "aws" {
  region  = "ap-south-1"
  shared_credentials_files  = ["/root/.aws/credentials"]
}


resource "aws_instance" "ec2_example" {

    ami = "ami-02b49a24cfb95941c"  
    instance_type = "t2.micro" 
    key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]

  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("/home/shwetatiwarii1994/aws")
      timeout     = "4m"
   }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0" ]
      description      = ""
      ipv6_cidr_blocks = []
      from_port        = 0
      protocol         = "-1"
      security_groups  = []
      prefix_list_ids  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0" ]
     from_port        = 22
     description      = ""
     ipv6_cidr_blocks = []
     protocol         = "tcp"
     security_groups  = []
     prefix_list_ids  = []
     self             = false
     to_port          = 22
  }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD0/WGSq8QR0bil6/dksz1gAG6ZVFDe+IYGEWsgU82CfzSTuKicWH5eMR4NQbIWl3Eu2uAu20CyUHjRY2vwM3Ruz9kJQGuCrOWmDE8AKCflQwCeg5khzWgyo0oyWFxINiD4Ss2AvnMHQmvUkxPaZbAOXfNRcQcmuc9zJNjKmQen+mVpNlU066tfLaAnLDocmwynT9hCGgCFyGgsPPBddZAqZKVKfGZbs5jfUMUXMnWrvnVwvVeBFpfvAUY2k0DvwkShRvYd5HC44LkiFiZMisX8uv0p02hiMgX1tl5xsWznoiH7rZW/CtKkUUMDr9ypLPQvawdR4mM4PKgDTtWSRKTD root@terraform" 
}

