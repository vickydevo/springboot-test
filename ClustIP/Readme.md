# Testing ClusterIP Services in Kubernetes

ClusterIP services are only accessible from within the cluster. This document describes two methods to test a ClusterIP service without using port-forwarding.

## 1. Testing Using an Existing Pod

If you have a running pod that has utilities such as `curl` or `wget` installed, you can execute a command directly in that pod to test your service.

### Steps:

1. Identify a pod with the necessary tools.
2. Execute the following command (replace `<pod-name>` with the actual pod name):

   ```bash
   kubectl exec -it <pod-name> -- curl http://spring-service:8081
