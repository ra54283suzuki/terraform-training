provider "aws" {
  region  = "ap-northeast-1"
}

module "describe_regions_for_ec2" {
  source = "./iam_role"
  name = "describe-regions-for-ec2"
  identifier = "ec2.amazonaws.com"
  policy = data.aws_iam_policy_document.allow_describe_regions.json
}

module "example_sg" {
  source = "./security_group"
  name = "module-sg"
  vpc_id = "aws_vpc.example.id"
  port = 80
  cidr_blocks = ["0.0.0.0/0"]
}

module "http_sg" {
  source = "./security_group"
  name = "http-sg"
  vpc_id = "aws_vpc.example.id"
  port = 80
  cidr_blocks = ["0.0.0.0/0"]
}

module "https_sg" {
  source = "./security_group"
  name = "https-sg"
  vpc_id = "aws_vpc.example.id"
  port = 443
  cidr_blocks = ["0.0.0.0/0"]
}

module "http_redirect_sg" {
  source = "./security_group"
  name = "https-redirect-sg"
  vpc_id = "aws_vpc.example.id"
  port = 8080
  cidr_blocks = ["0.0.0.0/0"]
}

module "nginx_sg" {
  source = "./security_group"
  name = "nginx-sg"
  vpc_id = aws_vpc.example.id
  port = 80
  cidr_blocks = [aws_vpc.example.cidr_block]
}