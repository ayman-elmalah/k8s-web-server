# Kubernetes Node.js Web Application

This repository contains the configuration files needed to deploy a Node.js web application on Kubernetes.

## Prerequisites

- Docker installed on your machine
- Kubernetes cluster (Minikube, Docker Desktop Kubernetes, or any other Kubernetes cluster)
- kubectl CLI tool installed
- Git

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/ayman-elmalah/k8s-web-server.git
cd k8s-web-server
```

### Building the Docker Image

Build the Docker image locally:
```bash
docker build . -t aymanelmalah/k8s-web-server:1.2.0
```

### Push to Docker Registry

Login to Docker Hub:
```bash
docker login
```

Push the image:
```bash
docker push aymanelmalah/k8s-web-server:1.2.0
```

### Deploying to Kubernetes

Apply the Kubernetes manifests:
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

Verify the deployment:
```bash
kubectl get deployments
kubectl get pods
kubectl get services
```

### Accessing the Application

To access the application locally:
```bash
kubectl port-forward service/k8s-web-server-service 3000:3000
```

or using minikube:
```bash
minikube service k8s-web-server-service
```

The application will be available at:
```
http://localhost:3000
```

## Kubernetes Configuration Files

This repository includes two main Kubernetes configuration files:

- `deployment.yaml`: Defines the deployment configuration for the Node.js application
- `service.yaml`: Defines the service configuration for exposing the application

## Troubleshooting

If you encounter the "OCI runtime exec failed" error, ensure that the container has the necessary shell installed. The deployment has been configured to use `/bin/sh` instead of `bash`.

## Contributing

Feel free to submit issues and enhancement requests.

## Author

- [Ayman Elmalah](https://github.com/ayman-elmalah)
- Website: https://www.ayman-elmalah.com
- Twitter: [@ayman_elmalah](https://twitter.com/ayman_elmalah)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
