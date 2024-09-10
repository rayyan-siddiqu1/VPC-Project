
# AWS VPC and EC2 Infrastructure with Terraform

## Project Overview
This project automates the deployment of a secure and scalable AWS infrastructure using Terraform. The infrastructure includes a Virtual Private Cloud (VPC) with public and private subnets, EC2 instances, a NAT Gateway, and an Internet Gateway.

## Key Features
- **VPC Setup:** Includes public and private subnets for separating resources.
- **EC2 Instances:** Deployed in both public (with internet access) and private subnets (restricted from direct external access).
- **Internet Gateway:** Provides internet access to the public subnet.
- **NAT Gateway:** Enables secure outbound traffic from private subnet instances without exposing them to inbound traffic.
- **Security Groups:** Configured for least-privilege access to EC2 instances.

## Infrastructure Architecture
1. **VPC:** Defined with a CIDR block of `10.0.0.0/16`.
2. **Public Subnet:** Hosts an EC2 instance that can be accessed over the internet using an Internet Gateway.
3. **Private Subnet:** Hosts an EC2 instance with outbound internet access via a NAT Gateway for updates, while remaining isolated from inbound traffic.
4. **Automation:** The entire infrastructure is provisioned and managed through Terraform, allowing for scalable and repeatable deployments.

## How to Use
1. **Prerequisites:**
   - Terraform installed.
   - AWS CLI configured with the necessary permissions.
   
2. **Deployment Steps:**
   - Clone the repository.
   - Run `terraform init` to initialize the working directory.
   - Run `terraform apply` to deploy the infrastructure.

3. **Destroy Resources:**
   - When you're done, you can destroy the resources by running `terraform destroy`.

## Technologies Used
- **AWS Services:** VPC, EC2, Internet Gateway, NAT Gateway.
- **Terraform:** Infrastructure as Code for automating AWS deployments.

## Contact
Feel free to ask questions or suggest improvements! I’m happy to help or provide more details.
