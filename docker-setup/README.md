# Docker Deployment Example

This project demonstrates automated Docker installation and container deployment using two different approaches.

## What it does

- Installs Docker if not present
- Creates a Docker image with Nginx serving a static website
- Runs the container on port 80

## Two Docker Setup Methods

### Method 1: Terraform (Automated)

Deploy everything with a single command:

```bash
cd terraform/
terraform init
terraform apply
```

This will:

- Create an AWS EC2 instance
- Automatically install docker environment via cloud-init
- Set up SSH key pair for access

### Method 2: Manual VM + Script

Launch an EC2 instance manually from AWS Console using this [docker-install.sh](docker-install.sh) script in user data

## Docker Deployment

0. SSH into instance:

    ```sh
    ssh -i private-key user@vm-public-ip
    ```

1. create this directory

    ```sh
    mkdir -p static-web
    cd static-web
    ```

2. create a Dockerfile:

    ```sh
    touch Dockerfile
    ```

3. Update Dockerfile

    ```sh
    FROM nginx:alpine

    COPY index.html /usr/share/nginx/html
    ```

4. Let's download the static website:

    ```sh
    wget https://raw.githubusercontent.com/pravinmishraaws/Azure-Static-Website/refs/heads/main/index.html
    ```

5. Build Docker image

    ```sh
    docker build -t static-web:latest .
    ```

6. Run the container:

    ```sh
    docker run -d --name st-web -p 80:80 static-web:latest
    ```

7. Check Status

    ```sh
    docker ps
    ```

## Access

After deployment, access the static website at `http://<instance-ip>`

## Destroy

### Terraform destroy

```sh
terraform destroy -auto-approve
```

### Manual Destroy

Go to conosle and remove the VM.
