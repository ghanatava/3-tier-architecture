# Three-Tiered Architecture Deployment with Terraform

This Terraform project facilitates the creation of a three-tiered architecture on AWS. It comprises a Virtual Private Cloud (VPC) with multiple subnets (public, private, and database subnets), Internet Gateway (IGW), NAT Gateway (NAT GW), instances deployed in the subnets, a Network Load Balancer (NLB), and an Amazon RDS instance for PostgreSQL.

## Architecture Overview

This architecture is structured into three tiers:

1. **Public Tier**:
   - Contains a public subnet housing an EC2 instance acting as a web server.
   - The web server is accessible from the internet.

2. **Private Tier**:
   - Includes a private subnet housing another EC2 instance running a Django application on port 8000.
   - The Django server can communicate securely with the RDS PostgreSQL instance located in the database subnets.

3. **Database Tier**:
   - Consists of two private subnets dedicated to housing the RDS PostgreSQL instance.
   - It's isolated from direct internet access.

## Infrastructure Components

- **VPC**: A virtual network environment on AWS.
- **Subnets**: Divided into public, private, and database subnets for different functionalities.
- **Security Groups**: Defined to control inbound and outbound traffic for instances and RDS.
- **Internet Gateway (IGW)**: Enables communication between instances and the internet.
- **NAT Gateway (NAT GW)**: Allows private instances to access the internet while remaining private.
- **EC2 Instances**: Deployed in the public and private subnets.
- **Network Load Balancer (NLB)**: Directs incoming traffic from the public instance to the private instance running Django on port 8000.
- **Amazon RDS**: PostgreSQL database instance accessible from the private subnet.

## Usage

### Prerequisites

Before deploying this architecture, ensure the following:

- AWS CLI installed and configured with appropriate access credentials.
- Terraform installed on your local machine.
- Necessary IAM permissions to create and manage resources on AWS.

### Deployment Steps

1. Clone this repository to your local machine.

2. Configure AWS credentials using the AWS CLI if you haven't already:

    ```bash
    aws configure
    ```

3. Modify the `terraform.tfvars` file to set your desired configurations for the project.

4. Initialize the Terraform project:

    ```bash
    terraform init
    ```

5. Review the execution plan:

    ```bash
    terraform plan
    ```

6. Deploy the infrastructure:

    ```bash
    terraform apply
    ```

7. After deployment, retrieve the NLB DNS name from the Terraform output.

8. Access the web application by navigating to the NLB DNS name in your web browser.

9. Test the functionality by interacting with the web server.

### Clean Up

To avoid unnecessary costs, it's crucial to destroy the resources when they're no longer needed:

```bash
terraform destroy
