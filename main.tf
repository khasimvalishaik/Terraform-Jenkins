terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "null_resource" "change_buildid" {
  
  provisioner "local-exec" {
    command = "sudo ./myscript.sh $envbuildid"

    environment = {
      envbuildid = "${var.buildid}"
    }

  }
}

