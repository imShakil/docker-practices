# Docker Deployment Example

This project demonstrates automated Docker installation and container deployment using two different approaches.

## What it does

- Installs Docker if not present
- Creates a Docker image with Nginx serving a static website
- Runs the container on port 80

## Two Deployment Methods

### Method 1: Terraform (Automated)

Deploy everything with a single command:

```bash
cd terraform/
terraform init
terraform apply
```

This will:

- Create an AWS EC2 instance
- Automatically run the deployment script via cloud-init
- Set up SSH key pair for access

### Method 2: Manual VM + Script

1. Launch an EC2 instance manually from AWS Console
2. SSH into the instance
3. Run the deployment script:

```bash
chmod +x docker-deploy.sh
sudo ./docker-deploy.sh
```

## Files

- `docker-deploy.sh` - Main deployment script
- `terraform/main.tf` - Terraform configuration
- `terraform/backend.tf` - Terraform backend setup

## Requirements

- AWS CLI configured (for Terraform method)
- SSH key pair at `~/.ssh/id_rsa.pub` (for Terraform method)
- EC2 instance with internet access (for manual method)

## Access

After deployment, access the static website at `http://<instance-ip>`
