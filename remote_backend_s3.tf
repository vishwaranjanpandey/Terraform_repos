terraform {
  backend "s3" {
    bucket = "vishwaa"
    key    = "key/terraform.tfstate"
    region = "ap-south-1"
  }
}
