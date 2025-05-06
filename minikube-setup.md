# Minikube Setup Guide

This guide provides step-by-step instructions to set up Minikube on a Linux system.

## Prerequisites
- Ensure you have `sudo` privileges on your system.
- Install `curl` if not already installed.

### Step 3: Install Required Packages
```bash
sudo yum install git maven docker java-17-amazon-corretto -y 
sudo apt update && sudo apt install git maven docker.io openjdk-17-jdk -y
```


### Step 4: Start and Verify Docker Service
```bash
sudo systemctl start docker
sudo systemctl status docker
```

### Install Docker and Add User to Docker Group
1. Install Docker:
  ```bash
  sudo yum install docker -y && sudo usermod -aG docker $USER && newgrp docker
  ```

2. Verify Docker installation:
  ```bash
  docker --version
  ```

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
minikube start --driver=docker
```
**![Image](https://github.com/user-attachments/assets/f513eea3-79dd-49d3-beca-1c25e23fe1d9)**

```bash
minikube status
```
***![Image](https://github.com/user-attachments/assets/29cb950f-b7e7-4e87-8e95-2e384d1b2c62)***
 

### Step 8: Verify All Workloads Managed by Kubernetes

To list all workloads managed by Kubernetes, including Deployments, StatefulSets, DaemonSets, ReplicaSets, Jobs, CronJobs, and Pods, run the following command:

```bash
kubectl get all
```

### Explicitly List All Workload Types

To explicitly list all workload types with detailed information, use the following command:

```bash
kubectl get deployments,replicasets,jobs,cronjobs,pods,statefulsets,daemonsets
kubectl get all --show-kind --output=wide
```

### Step 10: Access Kubernetes Dashboard
Start the dashboard:
```bash
minikube dashboard
```
***![Image](https://github.com/user-attachments/assets/ba58d8b7-8537-440e-b0d3-c5c0b753dc93)***
For external access, in another client/terminal  set up a proxy:
```bash
kubectl proxy --address='0.0.0.0' --accept-hosts='^*$'
```
**![Image](https://github.com/user-attachments/assets/a666d12b-a143-413a-b30e-c4b6812c897a)**

Access the dashboard in your browser:
```
http://<your-ec2-public-ip>:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/
```
**![Image](https://github.com/user-attachments/assets/6d1c8d8e-cfac-43fe-b52f-6ae646e7e3b4)**

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
