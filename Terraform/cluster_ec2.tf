data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-03035978b5aeb1274"]
  }
}