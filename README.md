# Deploying a Flask App(simple API) on AWS Using Docker and Terraform

This Project provides step-by-step instructions for deploying a Flask web application using AWS, Docker, and Terraform. 

## Prerequisites

1. **AWS CLI**: Install and configure the AWS Command Line Interface on your local machine with your AWS credentials.

2. **Terraform**: Install Terraform on your local machine.

3. **Docker**: Install Docker on your local machine.

## Step 2: Containerizing Our Flask App with Docker

1. Create a `Dockerfile` for your Flask app. Specify the base image, copy your app files, and define how to run the app within the container.

2. Build a Docker image of your Flask app using the `docker build` command.

3. Test the Docker image locally to confirm that your app runs inside the container.

## Step 3: AWS Setup

1. Sign in to your AWS account or create one if needed.

2. Configure your AWS credentials on your local machine using the `aws configure` command.

## Step 4: Infrastructure as Code (IAC) with Terraform

1. Clone this repository or create your own Terraform configuration for AWS.

2. Customize the Terraform configuration (`main.tf`) to specify the following:
   - EC2 instance details (type, region, etc.).
   - Security groups to allow incoming traffic.
   - Key pair for SSH access.
   - User data script to install Docker, pull your Docker image, and run the Flask app.

3. Initialize Terraform with `terraform init`.

4. Deploy the infrastructure with `terraform apply`. Confirm by typing `yes` when prompted.

## Step 5: Network Configuration and Security

1. Ensure that your EC2 instance's security group allows incoming traffic on the required ports (e.g., port 80 for HTTP).

2. Verify that your AWS Virtual Private Cloud (VPC) and subnet settings permit incoming traffic to your EC2 instance.

3. Access your Flask app using the EC2 instance's public IP address.

## Accessing Your Flask App

1. To access your Flask app, use the public IP address of your EC2 instance (e.g., `http://<EC2_PUBLIC_IP>`).

This Project provides an overview of the deployment process using above tools.
