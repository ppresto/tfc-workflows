provider "aws" {
  region  = var.aws_region
}

provider "tfe" {
  hostname = var.tfe_hostname
  token = var.tfe_token
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    tfe = {
      version = "~>0.25"
    }
  }
}
