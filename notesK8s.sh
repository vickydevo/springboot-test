#!/bin/bash

# Step 1: Download Minikube binary
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Step 2: Install Minikube and remove the downloaded binary
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# Step 3: Check Minikube status
minikube status

# Step 4: Install necessary packages
sudo yum install git maven docker java-17-amazon-corretto -y

# Step 5: Start Docker service
sudo systemctl start docker

# Step 6: Check Docker service status
sudo systemctl status docker

# Step 7: Download kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Step 8: Make kubectl binary executable
chmod +x kubectl

# Step 9: Create directory for kubectl
mkdir -p ~/.local/bin

# Step 10: Move kubectl to the local bin directory
mv ./kubectl ~/.local/bin/kubectl
# Edit your shell profile file (.bashrc, .zshrc, or .profile):


Edit
nano ~/.bashrc

# Add this line at the end:
Edit
export PATH="$HOME/.local/bin:$PATH"

# Step 11: Verify kubectl installation
kubectl version --client

# Step 12: Verify kubectl installation with YAML output
kubectl version --client --output=yaml

# Step 13: Start Minikube with Docker driver
  
sudo usermod -aG docker $USER && newgrp docker

minikube start --driver=docker

minikube status
# minikube
# type: Control Plane
# host: Running
# kubelet: Running
# apiserver: Running
# kubeconfig: Configured



# Step 14: (Optional) Force start Minikube with Docker driver if needed
# minikube start --driver=docker --force

# Step 15: Get all Kubernetes resources to verify Minikube setup
kubectl get all


# Get the name of the pods
kubectl get pods -l app=spring

# Example output:
# NAME                                  READY   STATUS    RESTARTS   AGE
# springboot-deployment-7d6949f574-gwtwq   1/1     Running   0          22m
# springboot-deployment-7d6949f574-kfj4d   1/1     Running   0          22m
# springboot-deployment-7d6949f574-mvn8c   1/1     Running   0          22m

# Choose any one of the pod names from the list
kubectl port-forward pod/springboot-deployment-7d6949f574-gwtwq 8081:8081

kubectl logs springboot-deployment-7d6f49566c-5qk8w

# Access the application locally in your host
    curl http://localhost:8081
    Greetings from  'vignan' deployed JAVA app in virtual Machine..!!! Host private IPv4 Address: 10.244.0.5


#  access externally in browser
# if you deployed application in ec2/azure vm

kubectl port-forward service/spring-service 8081:8081 --address 0.0.0.0

  ec2-public-ip:8081
  http://100.27.17.207:8081/


STEP 8 Hit the below command to start the kubernetes
dashboard in EC2


/usr/local/bin/minikube dashboard
* Enabling dashboard ...
  - Using image docker.io/kubernetesui/dashboard:v2.7.0
  - Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

* Verifying dashboard health ...
* Launching proxy ...
* Verifying proxy health ...
http://127.0.0.1:41355/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/



STEP 9 [ IN NEW EC2 WINDOW ] -
Open the EC2 in new window and set the PROXY  Use case

kubectl proxy --address='0.0.0.0' --accept-hosts='^*$'
Starting to serve on [::]:8001


STEP 9 - Hit in browser to view the dashboard              open port 8001
http://100.27.17.207:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/pod?namespace=default




kubectl apply -f ./sample_deploy.yml
kubectl get deployment my-deployment
kubectl logs springboot-deployment-7d6f49566c-5qk8w

kubectl describe deployment <deployment-name>




kubectl delete -f ./sample_deploy

kubectl apply -f ./sample_pod.yml

kubectl get pods
kubectl describe pod my-pod   (complete details)
kubectl edit
