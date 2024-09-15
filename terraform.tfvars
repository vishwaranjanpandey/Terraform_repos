vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-proj-ap-south-1-vpc"
availability_zone    = ["ap-south-1a","ap-south-1b"]
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD0/WGSq8QR0bil6/dksz1gAG6ZVFDe+IYGEWsgU82CfzSTuKicWH5eMR4NQbIWl3Eu2uAu20CyUHjRY2vwM3Ruz9kJQGuCrOWmDE8AKCflQwCeg5khzWgyo0oyWFxINiD4Ss2AvnMHQmvUkxPaZbAOXfNRcQcmuc9zJNjKmQen+mVpNlU066tfLaAnLDocmwynT9hCGgCFyGgsPPBddZAqZKVKfGZbs5jfUMUXMnWrvnVwvVeBFpfvAUY2k0DvwkShRvYd5HC44LkiFiZMisX8uv0p02hiMgX1tl5xsWznoiH7rZW/CtKkUUMDr9ypLPQvawdR4mM4PKgDTtWSRKTD root@terraform"

ec2_ami_id = "ami-0888ba30fd446b771"
