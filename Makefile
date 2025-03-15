# Kubernetes deployment commands
.PHONY: deploy service forward all clean

# Deploy everything
run: deploy service forward

# Apply deployment
deploy:
	kubectl apply -f deployment.yaml

# Apply service
service:
	kubectl apply -f service.yaml

# Forward port
forward:
	@echo "Waiting for pods to be ready..."
	kubectl wait --for=condition=ready pod -l app=k8s-web-server --timeout=60s
	kubectl port-forward service/k8s-web-server-service 3000:3000

# Show status
status:
	@echo "Checking deployment status..."
	kubectl get deployments
	@echo "\nChecking pods status..."
	kubectl get pods
	@echo "\nChecking service status..."
	kubectl get services

# Clean up resources
clean:
	kubectl delete -f deployment.yaml
	kubectl delete -f service.yaml 