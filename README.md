# Docker Practices

This repository demonstrates Docker containerization using single-stage and multi-stage builds.

## Single-Stage Docker Build

Simple Docker build process where all operations happen in one stage.

**Example**: [docker-setup/Dockerfile](docker-setup/Dockerfile)

- Uses single base image
- Includes all dependencies in final image
- Larger image size but simpler build process

## Multi-Stage Docker Build

Optimized build process using multiple stages to reduce final image size.

**Example**: [multi-stage-docker/](multi-stage-docker/)

- Build stage: Compiles application
- Production stage: Only runtime dependencies
- Smaller, more secure final image

## Projects

- **[docker-setup/](docker-setup/)** - Basic Docker deployment with Terraform
- **[multi-stage-docker/](multi-stage-docker/)** - React app with single vs multi-stage builds
