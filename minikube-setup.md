# Minikube Setup Guide

This guide provides step-by-step instructions to set up Minikube on a Linux system.

## Prerequisites
- Ensure you have `sudo` privileges on your system.
- Install `curl` if not already installed.

## Steps

### Step 1: Download and Install Minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
```

### Step 2: Verify Minikube Installation
```bash
minikube status
```

### Step 3: Install Required Packages
```bash
sudo yum install git maven docker java-17-amazon-corretto -y
```

### Step 4: Start and Verify Docker Service
```bash
sudo systemctl start docker
sudo systemctl status docker
```

### Step 5: Install `kubectl`
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
```

#### Add `kubectl` to PATH
Edit your shell profile file (e.g., `~/.bashrc`):
```bash
nano ~/.bashrc
```
Add the following line at the end:
```bash
export PATH="$HOME/.local/bin:$PATH"
```
Reload the shell profile:
```bash
source ~/.bashrc
```

### Step 6: Verify `kubectl` Installation
```bash
kubectl version --client
kubectl version --client --output=yaml
```

### Step 7: Start Minikube with Docker Driver
```bash
sudo usermod -aG docker $USER && newgrp docker
minikube start --driver=docker
minikube status
```

### Step 8: Verify Kubernetes Resources
```bash
kubectl get all
```

### Step 9: Port Forward and Access Application
1. Get the name of the pods:
  ```bash
  kubectl get pods -l app=spring
  ```
2. Forward the port:
  ```bash
  kubectl port-forward pod/<pod-name> 8081:8081
  ```
3. Access the application locally:
  ```bash
  curl http://localhost:8081
  ```

### Step 10: Access Kubernetes Dashboard
Start the dashboard:
```bash
minikube dashboard
```

For external access, set up a proxy:
```bash
kubectl proxy --address='0.0.0.0' --accept-hosts='^*$'
```
Access the dashboard in your browser:
```
http://<your-ec2-public-ip>:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/
```

### Step 11: Deploy and Manage Applications
- Apply a deployment:
  ```bash
  kubectl apply -f ./sample_deploy.yml
  ```
- Check deployment status:
  ```bash
  kubectl get deployment my-deployment
  ```
- View logs:
  ```bash
  kubectl logs <pod-name>
  ```
- Delete a deployment:
  ```bash
  kubectl delete -f ./sample_deploy.yml
  ```

### Cleanup
To delete all resources:
```bash
kubectl delete -f ./sample_pod.yml
```

You're now ready to use Minikube for your Kubernetes development needs!
