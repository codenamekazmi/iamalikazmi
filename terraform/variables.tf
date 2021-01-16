terraform {
  required_version = ">= 0.12"

  backend "s3" {
    profile        = "default"
    bucket         = "terraform-remote-state-ali-infra"
    key            = "personal/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "terraform-remote-state-ali-infra-lock"
  }
}

variable "region" {
  description = "AWS region to provision resources"
  default     = "us-east-1"
}

variable "domain" {
  description = "DNS domain for web S3 distribution - (ex. reedflinch.io)"
  default     = "iamalikazmi.io"
}

variable "bucket_name" {
  description = "Name of web S3 bucket"
  default     = "iamalikazmiio"
}

data "aws_acm_certificate" "web" {
  domain   = "${var.domain}"
  statuses = ["ISSUED", "PENDING_VALIDATION"]
}