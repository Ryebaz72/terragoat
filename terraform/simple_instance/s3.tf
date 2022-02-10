provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {

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
  bucket         = "docking-bay-storage-20220210160425264800000001"
  hosted_zone_id = "Z3BJ6K6RIION7M"
  request_payer  = "BucketOwner"
  versioning     = { "enabled" : false, "mfa_delete" : false }
}


resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    self        = false
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
  vpc_id = "vpc-01853c662e11abdfd"
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
  associate_public_ip_address = true
  availability_zone           = "us-west-2c"
  cpu_core_count              = 1
  cpu_threads_per_core        = 1
  credit_specification        = { "cpu_credits" : "standard" }
  disable_api_termination     = false
  ebs_optimized               = false
  get_password_data           = false
  hibernation                 = false
  ipv6_address_count          = 0
  metadata_options            = { "http_endpoint" : "enabled", "http_put_response_hop_limit" : "1", "http_tokens" : "optional" }
  monitoring                  = false
  private_ip                  = "172.31.15.195"
  root_block_device           = { "delete_on_termination" : true, "encrypted" : false, "iops" : "100", "volume_size" : "8", "volume_type" : "gp2" }
  source_dest_check           = true
  subnet_id                   = "subnet-0a6bd1860c3c4e446"
  tenancy                     = "default"
  vpc_security_group_ids      = ["sg-09d994108230f0ad5"]
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

  owners = ["099720109477"] # Canonical-1
}
