provider "aws" {
  region = local.region
}

locals {
  environment = "prod"
  region      = "us-east-1"
  name        = "skaf"
}

################################################################################
# Key Pair Module
################################################################################

module "key_pair" {
  source = "squareops/keypair/aws"

  key_name           = format("%s-%s-kp", local.environment, local.name)
  ssm_parameter_path = format("%s-%s-ssm", local.environment, local.name) #SSM parameter secret name
  environment        = local.environment

}
