provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "d2d34e6b2a02dca8edc09d7dd137e7e30c04aeb7"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-10 15:34:00"
    git_last_modified_by = "Ryebaz72@users.noreply.github.com"
    git_modifiers        = "Ryebaz72"
    git_org              = "Ryebaz72"
    git_repo             = "terragoat"
    yor_trace            = "ea3e6629-46c2-44d5-a468-706d9fda1e4a"
  }
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "3991385e2ffda0cea59159ee5cef5f77d3f2ae92"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-10 15:55:49"
    git_last_modified_by = "Ryebaz72@users.noreply.github.com"
    git_modifiers        = "Ryebaz72"
    git_org              = "Ryebaz72"
    git_repo             = "terragoat"
    yor_trace            = "e2377010-18df-4c38-bcbe-cac0fc845785"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "3991385e2ffda0cea59159ee5cef5f77d3f2ae92"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-10 15:55:49"
    git_last_modified_by = "Ryebaz72@users.noreply.github.com"
    git_modifiers        = "Ryebaz72"
    git_org              = "Ryebaz72"
    git_repo             = "terragoat"
    yor_trace            = "b2f46dca-cbf5-46af-828e-46142f4b9e8e"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
