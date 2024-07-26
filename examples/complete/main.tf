# Local Variables declaration
locals {
  name        = "key"
  aws_region  = "us-east-2"
  environment = "prod"
  tags = {
    Environment = "stg"
    Name        = "key_pair"
    cost        = format("%s-%s-kp", local.environment, local.name)
  }
  additional_aws_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

# Using "squareops/keypair/aws" module to generate an EC2 key pair and storing it in ssm parameter store.
module "key_pair" {
  source             = "squareops/keypair/aws"
  version            = "1.0.3"
  key_pair_name      = format("%s-%s-kp", local.environment, local.name)
  environment        = local.environment
  ssm_parameter_path = format("%s-%s-ssm", local.environment, local.name) #SSM parameter secret name
  tags               = local.tags
}
