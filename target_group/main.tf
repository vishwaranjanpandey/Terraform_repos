variable "target-group-name"  {}
variable "port-number"  {}
variable "target-group-protocol"  {}
variable "vpc-id" {}
variable "ec2_instance_id"  {}



output "dev-target-group_arn" {
   value = aws_lb_target_group.dev-target-group.arn
}



resource "aws_lb_target_group" "dev-target-group" {
  name     = var.target-group-name
  port     = var.port-number
  protocol = var.target-group-protocol
  vpc_id   = var.vpc-id
  health_check  {
    path = "/"
    port = 80
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"  # has to be HTTP 200 or fails
	}
}



resource "aws_lb_target_group_attachment"  "dev-target-group-attachement" {
   target_group_arn  = aws_lb_target_group.dev-target-group.arn
   target_id   = var.ec2_instance_id
   port        =   80
}


