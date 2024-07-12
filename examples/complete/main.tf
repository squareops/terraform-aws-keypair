# Local Variables declaration
locals {
  name        = "key"
  region      = "us-east-2"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

# Using "squareops/keypair/aws" module to generate an EC2 key pair and storing it in ssm parameter store.
module "key_pair" {
  source             = "squareops/keypair/aws"
  version            = "1.0.2"
  key_name           = format("%s-%s-kp", local.environment, local.name)
  environment        = local.environment
  ssm_parameter_path = format("%s-%s-ssm", local.environment, local.name) #SSM parameter secret name
}
