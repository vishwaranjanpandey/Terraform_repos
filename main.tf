module "networking" {
  source              = "./networking"
  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  availability_zone   = var.availability_zone
  cidr_public_subnet  = var.cidr_public_subnet
  cidr_private_subnet = var.cidr_private_subnet
}


module "security_group" {
  source              = "./security_group"
  vpc_id              = module.networking.dev_project_vpc_id
  ec2_sg_name         = "SG for EC2 to enable SSH(22), HTTPS(443) and HTTP(80)"
  ec2_jenkins_sg_name = "Allow port 8080 for jenkins"
}

module "ec2_instance" {
  source                   = "./ec2_instance"
  ami_id                   = var.ec2_ami_id
  instance_type            = "t2.micro"
  tag_name                 = "jenkins_ec2_instance"
  public_key               = var.public_key
  subnet_id                = tolist(module.networking.dev_project_vpc_publicsubnet_id)[0]
  sg_id                    = module.security_group.ec2_security_gp_id
  enable_public_ip_address = true
}


module "target_group" {
  source                = "./target_group"
  target-group-name     = "dev-target-group"
  port-number           = "80"
  target-group-protocol = "HTTP"
  vpc-id                = module.networking.dev_project_vpc_id
  ec2_instance_id       = module.ec2_instance.jenkins_ec2_instance_ip

}

