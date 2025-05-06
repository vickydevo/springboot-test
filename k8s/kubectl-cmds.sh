#!/bin/bash

# Basic Commands
echo "## Basic Commands ##"
# kubectl help
# kubectl cluster-info
# kubectl get all
# kubectl version --short


# Applying and Managing YAML Files
echo "## Applying and Managing YAML Files ##"
# kubectl apply -f <file-name>.yaml
# kubectl delete -f <file-name>.yaml

# Working with Namespaces
echo "## Working with Namespaces ##"
# kubectl get namespaces
# kubectl create namespace <namespace-name>
# kubectl delete namespace <namespace-name>
# kubectl config set-context --current --namespace=<namespace-name>

# Working with Pods
echo "## Working with Pods ##"
# kubectl get pods
# kubectl describe pod <pod-name>
# kubectl logs <pod-name>
# kubectl exec -it <pod-name> -- <command>
# kubectl delete pod <pod-name>

# Working with Deployments
echo "## Working with Deployments ##"
# kubectl get deployments
# kubectl create deployment <deployment-name> --image=<image-name>
# kubectl set image deployment/<deployment-name> <container-name>=<new-image>
# kubectl scale deployment <deployment-name> --replicas=<number>
# kubectl delete deployment <deployment-name>

# Working with Services
echo "## Working with Services ##"
# kubectl get services
# kubectl expose deployment <deployment-name> --type=<service-type> --port=<port> --target-port=<target-port>
# kubectl delete service <service-name>

# Working with ReplicaSets
echo "## Working with ReplicaSets ##"
# kubectl get replicasets
# kubectl delete replicaset <replicaset-name>

# Working with ConfigMaps
echo "## Working with ConfigMaps ##"
# kubectl create configmap <configmap-name> --from-file=<path-to-file>
# kubectl get configmaps
# kubectl describe configmap <configmap-name>
# kubectl delete configmap <configmap-name>

# Working with Secrets
echo "## Working with Secrets ##"
# kubectl create secret generic <secret-name> --from-literal=<key>=<value>
# kubectl get secrets
# kubectl describe secret <secret-name>
# kubectl delete secret <secret-name>

# Working with Persistent Volumes and Persistent Volume Claims
echo "## Working with Persistent Volumes and Persistent Volume Claims ##"
# kubectl get pv
# kubectl get pvc
# kubectl delete pvc <pvc-name>

# Working with Jobs and CronJobs
echo "## Working with Jobs and CronJobs ##"
# kubectl get jobs
# kubectl apply -f <job-file>.yaml
# kubectl delete job <job-name>
# kubectl get cronjobs
# kubectl delete cronjob <cronjob-name>



# Configuring Access and Context
echo "## Configuring Access and Context ##"
# kubectl config current-context
# kubectl config get-contexts
# kubectl config use-context <context-name>

# Resource Management and Debugging
echo "## Resource Management and Debugging ##"
# kubectl top nodes
# kubectl top pods
# kubectl get events
# kubectl run -i --tty busybox --image=busybox -- sh

echo "Script finished executing."
