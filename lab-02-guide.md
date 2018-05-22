# Terraform demo and hands-on lab

_Prerequisites: Terraform installed on your system; an AWS account; AWS CLI installed and configured for your account; at least steps 1 through 7 of the Git hands-on lab completed (must have a cloned copy of the repository available locally)_

1. Change into the directory where Git cloned the repository, then change into the `terraform` subdirectory.

2. Rename the `terraform.tfvars.example` file to `terraform.tfvars`.

3. Edit the new `terraform.tfvars` file to use the desired values for AWS region, EC2 instance type, and SSH key.

4. Run `terraform init` to initialize the Terraform configuration.

5. Run `terraform plan` to have Terraform examine existing resources and determine what actions would be necessary to create the stated configuration.

6. Review the output of the `terraform plan` command so that you have an idea of what Terraform is going to do to create the stated configuration.

7. Run `terraform apply` to have Terraform take the actions necessary to create the stated configuration. When prompted, type "yes" and press Enter.

8. When Terraform is finished running, log into your AWS console. Spend a few minutes verifying that Terraform created the desired resources (look for new instances, new security groups, new subnets, and a new VPC).

Complete the following steps only **after you have finished the Ansible lab** and are ready to clean up your AWS infrastructure.

1. Run `terraform destroy` to destroy all the AWS resources created by Terraform at the start of this lab. When prompted, type "yes" and press Enter.

2. When Terraform has finished running, return to your AWS console and verify that the resources you saw there earlier (in step 8) are no longer present.
