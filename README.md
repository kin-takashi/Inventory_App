# Buoc 1: ket noi Docker trong Minikube
minikube start
minikube -p minikube docker-env | Invoke-Expression


# buoc 2: Build image
docker build -t inventory-app:latest .

# Buoc 3: Tr khai Postgres and app
kubectl apply -f k8s/postgres-deployment.yaml
kubectl apply -f k8s/inventory-deployment.yaml
kubectl apply -f k8s/service.yaml

# buoc 4: Kiem tra pod
kubectl get pods

# Buoc 5: Open app
minikube service inventory-service



# check log app
kubectl logs deployment/inventory-app

-> exspect result
Connected to database inventory_db
Uvicorn running on http://0.0.0.0:8000

# open service from web
minikube service inventory-service

->results
http://127.0.0.1:31452
