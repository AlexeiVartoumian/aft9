data "aws_vpc" "aft_management_vpc" {
  
  id = "vpc-008bccf901727ec9d"
}

data "aws_subnet" "aft_public_subnet_01" {
  
  vpc_id   = data.aws_vpc.aft_management_vpc[count.index].id
  filter {
    name   = "tag:Name"
    values = ["aft-vpc-public-subnet-01"]
  }
}

data "aws_instance" "cloud9-instance" {
  filter {
    name = "tag:aws:cloud9:environment"
    values = [
    aws_cloud9_environment_ec2.cloud9-aft.id]
  }
}