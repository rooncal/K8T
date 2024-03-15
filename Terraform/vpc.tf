resource "aws_vpc" "cluster_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "Training"
  }

}