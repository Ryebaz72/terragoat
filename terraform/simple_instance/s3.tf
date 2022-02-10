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
