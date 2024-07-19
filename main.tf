# Module block for creating an EC2 key pair
module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  version            = "2.0.3"
  key_name           = var.key_pair_name
  create_private_key = var.create_private_key
  tags               = var.tags
}

# Resource block for storing the private key in AWS Systems Manager Parameter Store
resource "aws_ssm_parameter" "ssm_ec2_keypair" {
  name        = var.ssm_parameter_path
  description = "Stores the private key of ec2 key pair"
  type        = "SecureString"
  value       = module.key_pair.private_key_pem
  tags        = var.tags
}
