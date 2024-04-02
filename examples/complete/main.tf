locals {
  name        = "key"
  aws_region  = "us-east-2"
  environment = "prod"
  tags = {
    Environment = "stg"
    Name        = "key_pair"
  }
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "key_pair" {
  source             = "squareops/keypair/aws"
  key_pair_name      = format("%s-%s-kp", local.environment, local.name)
  environment        = local.environment
  ssm_parameter_path = format("%s-%s-ssm", local.environment, local.name) #SSM parameter secret name
}
