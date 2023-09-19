terraform {
    cloud {
    organization = "Delphi"

    workspaces {
      name = "terra_house-1"
    }
  }

  required_providers {
    random = {
        source = "hashicorp/random"
        version = "3.5.1"
    }  
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
    #Configuration options
  
}


provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""

  
}
resource "random_string" "bucket_name" {
    length = 32
    lower = true
    upper = false
    special = true
    override_special = "_-"
  
}
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

  
}
output "random_bucket_name" {
    value = random_string.bucket_name.result
  
}

