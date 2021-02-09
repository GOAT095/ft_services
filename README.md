**1 - Kubernetes Tutorial:**
https://www.youtube.com/watch?v=X48VuDVv0do

**2 - Kubernetes YAML File Explained - Deployment and Service:**
https://www.youtube.com/watch?v=qmDzcu5uY1I

**3 - Basic Docker Commands:**
```
# Build a docker image from a Dockerfile
docker build -t {IMAGE_NAME} {DOCKERFILE_DIR}

# Start an instance of a docker image
docker run -it -p {SPECIFY_PORT} -d {IMAGE_NAME}
(-it stands for --> interactive terminal)
(-d stands for ---> detached mode)

# See all images
docker images

# Start a container
docker start {CONTAINER ID}

# See running containers
docker ps

# See unrunning container
docker ps -a

# Get a shell in a container
docker exec -it {CONTAINER ID} sh

# Stop a container
docker kill {CONTAINER ID}

# Delete all unused Docker images and cache
docker system prune
```

**4 - Managing Pods With Kubernetes:**
```
# Create a pod from a YAML file
kubectl create -f {FILE_NAME.yaml}

# Delete a pod
kubectl delete deployment {DEPLOYMENT}
kubectl delete service {SERVICE}

# Get a shell in a pod
kubectl exec -it <POD_NAME> -- /bin/sh

# Restart a deployment
kubectl rollout restart deployment {NAME}

# Launch minikube dashboard
minikube dashboard

# Get cluster external IP
minikube ip

# Reset Minikube VM
minikube delete
```
