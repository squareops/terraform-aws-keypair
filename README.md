# AWS EC2 Keypair
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>

This module is a reusable Terraform module that simplifies the creation and management of an EC2 key pair on AWS. This module creates an EC2 key pair and securely stores the private key in the AWS Systems Manager Parameter Store (SSM). The module also returns the key pair name and the SSM parameter ARN for later use in other resources, making it easy to reference the key pair in other parts of your infrastructure. Using this module can help you save time and effort in managing your key pairs while ensuring security and compliance in your AWS environment.

## Usage Example

```hcl
module "key_pair" {
  source = "squareops/keypair/aws"
  key_name           = "example-key"
  environment        = "production"
  ssm_parameter_path = "production-example-key"
}
```
Refer [this](https://github.com/squareops/terraform-aws-keypair/tree/main/examples) for more examples.


## Retrieve Private Key

To Retrieve the Private key from SSM:
```bash
aws ssm get-parameter --name "<ssm_parameter_path>" --region "<region>" --query Parameter.Value --output text
```

Additionally, to save the private key to a file:
```bash
aws ssm get-parameter --name "<ssm_parameter_path>" --region "<region>" --with-decryption --query Parameter.Value --output text > keypair.pem
```

## IAM Permission
The required IAM permissions to create resources from this module can be found [here](https://github.com/squareops/terraform-aws-keypair/blob/main/IAM.md)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.21 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.21 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | terraform-aws-modules/key-pair/aws | 2.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.ssm_ec2_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Specifies the identifier for the environment where the key pair will be used. | `string` | `""` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Specifies the name to be assigned to the key pair that will be generated. | `string` | `""` | no |
| <a name="input_ssm_parameter_path"></a> [ssm\_parameter\_path](#input\_ssm\_parameter\_path) | Specifies the SSM parameter name that will be used to store the generated key pair. | `string` | `"/example/ssm"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_pair_name"></a> [key\_pair\_name](#output\_key\_pair\_name) | The name of the key pair generated for the EC2 instance. |
| <a name="output_ssm_parameter_arn"></a> [ssm\_parameter\_arn](#output\_ssm\_parameter\_arn) | The Amazon Resource Name (ARN) of the SSM parameter used to store the EC2 instance key pair. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribution & Issue Reporting

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/squareops/terraform-aws-keypair/issues) on GitHub
  2. Search to see if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Make sure to provide enough context and details .

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/).

## Support Us

To support a GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository](https://github.com/squareops/terraform-aws-keypair)

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Starring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).
