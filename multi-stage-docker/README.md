# Docker Multi Stage Container Image

Comparison of single-stage vs multi-stage Docker builds for a React application.

## Single-Stage Build ([Dockerfile.single](Dockerfile.single))

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY ./my-react-app .
RUN npm install && npm run build && npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]
```

**Characteristics:**

- Single base image with all tools
- Includes build dependencies in final image
- Larger image size (~500MB+)

## Multi-Stage Build ([Dockerfile](Dockerfile))

```dockerfile
# Build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY ./my-react-app .
RUN npm install && npm run build

# Production stage  
FROM nginx:alpine AS production
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

**Benefits:**

- Smaller final image (~50MB)
- No build dependencies in production
- Better security posture
- Faster deployment

## Usage

```bash
# Single-stage build
docker build -f Dockerfile.single -t react-app:single .

# Multi-stage build
docker build -t react-app:multi .

# Run containers
docker run -p 3000:3000 react-app:single
docker run -p 80:80 react-app:multi
```
