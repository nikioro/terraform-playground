terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "tf-remote-state-niau"
    key    = "remotestate/terrafrom-playground/"
    region = "eu-west-1"
    profile="localAdmin"
  }
}
provider "aws" {
    region=var.region
    profile=var.profile
  # Configuration options
default_tags {
   tags = {
     Environment = "dev"
     Owner       = "TFProviders"
     Project     = "terraform-playground"
     ManagedByTerraform = "true"
   }
 }
}

module "my-ec2" {
    source = "./modules/aws-ec2"
    
}