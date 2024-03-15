resource "aws_subnet" "cluster_subnet" {
  vpc_id            = aws_vpc.cluster_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_az

  tags = {
    Name = "k8s-cluster-network"
  }
}

data "aws_ami" "ubuntu-ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = [var.k8s_ami]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "cluster-key"
  public_key = var.ssh_public_key
}

resource "aws_instance" "node" {
  count = 3
  ami           = data.aws_ami.ubuntu-ami.id
  instance_type = var.aws_k8s_instance_type
  subnet_id = aws_subnet.cluster_subnet.id
  associate_public_ip_address = true
  key_name = "cluster-key"
  tags = {
    Name = "k8s-node-${count.index + 1}"
  }
  lifecycle {
    ignore_changes = [associate_public_ip_address]
  }
}