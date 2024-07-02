module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  version            = "2.0.0"
  key_name           = var.key_pair_name
  create_private_key = var.create_private_key
}


resource "aws_ssm_parameter" "ssm_ec2_keypair" {
  name        = var.ssm_parameter_path
  description = "Stores the private key of ec2 key pair"
  type        = "SecureString"
  value       = module.key_pair.private_key_pem
  tags        = var.tags
}
