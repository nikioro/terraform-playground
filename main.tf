terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.8.0"
    }
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