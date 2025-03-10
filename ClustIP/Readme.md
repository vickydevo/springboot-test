# Testing ClusterIP Services in Kubernetes

ClusterIP services in Kubernetes are only accessible from within the cluster. This document describes two methods to test a ClusterIP service without using port-forwarding.

---

## 1. Testing Using an Existing Pod

If you have a running pod that already includes utilities such as `curl` or `wget`, you can execute a command directly in that pod to test your service.

### Steps:
1. Identify a pod that has the necessary tools.  
   *If your pod doesn't have `curl` or `wget`, you may need to install them, or use another pod that has them installed.*
2. Execute the following command (replace `<pod-name>` with the actual pod name):

   ```bash
   kubectl exec -it <pod-name> -- curl http://spring-service:8081
This command sends a request to the ClusterIP service (spring-service) on port 8081 from within the cluster.

## 2. Testing by Creating a Temporary Pod
If none of your existing pods have the required tools, you can create a temporary pod that includes them.

Option A: Using Busybox (with wget)
Run a temporary pod using the Busybox image:
```bash

kubectl run temp-test --rm -it --image=busybox --restart=Never -- sh
```
Once inside the pod, execute:
```sh

wget -qO- http://spring-service:8081
```
This command fetches the output from the ClusterIP service.
Option B: Using curlimages/curl (with curl)
## Run a temporary pod using the curlimages/curl image:
```bash

kubectl run temp-curl --rm -it --image=curlimages/curl --restart=Never -- sh
```
Once inside the pod, execute:
```sh

curl http://spring-service:8081
```
## This command sends a request to the ClusterIP service using curl.