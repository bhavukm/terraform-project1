# terraform-project1

**Architectural Diagram & Workflow:**

<img width="1023" height="680" alt="image" src="https://github.com/user-attachments/assets/54344869-49ad-469d-8070-f36aabdfb859" />

**Problem Statement Highlighting a Real World Problem:**

A developer needs a secure network foundation to deploy a private application server. This server should be accessible only from a bastion host (jump server). The application server should also be able to download

software package updates from a remote repository on the internet securely. It must be reusable across dev/stage/prod, and minimize public exposure.

**Solution:**

A single Terraform stack that builds a VPC with public and private subnets, NAT gateway, route tables (public and private), and security groups (bastion, application server).

Resource Names include an environment suffix so the same code can be used for dev/stage/prod by swapping `*.tfvars`.

# Step-by-Step Instructions to deploy the project via Terraform:

1. Install Terraform: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

2. Install AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

3. Configure AWS CLI: https://youtu.be/TF9oisb1QJQ

4A. Create an S3 Bucket: aws s3api create-bucket --bucket tf-state-<some-random-text> --region us-east-1

4B. Create a SSH key-pair: aws ec2 create-key-pair --key-name train2 --key-type rsa --key-format pem

5. Create DynamoDB table for state locking:

aws dynamodb create-table --table-name tf-locks --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
--region us-east-1

**Explanation of the different command flags:**

--table-name tf-locks → Name of the DynamoDB table

--attribute-definitions → Defines LockID as a string (S)

--key-schema → Sets LockID as the partition key (HASH)

--provisioned-throughput → 1 read & 1 write per second (enough for Terraform)

--region → Region where the table will be created

6. git clone https://github.com/bhavukm/terraform-project1.git  # Please ensure that git is also installed

7. cd terraform-project1

8. Replace all placeholders in the Terraform script files:

9. terraform init

10. terraform plan

11. terraform apply -auto-approve

12. Verify from AWS Management Console that all AWS resources have been created successfully

13. SSH to Bastion Host >> Create the private ssh-key file (train2.pem) >> run: chmod 400 train2.pem

14. ssh -i train2.pem ec2-user@<private-ip-of-app-server>

15. Run: sudo yum install httpd -y

16. To destroy all resources: Run >> terraform destroy -auto-approve
