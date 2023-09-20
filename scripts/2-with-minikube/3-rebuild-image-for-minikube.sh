#eval $(minikube podman-env)
eval $(minikube docker-env)
echo 'Este comando ainda não funciona. WIP'

docker build -t k8s-demo-image ./app
docker tag k8s-demo-image localhost:50929/k8s-demo-image
docker push localhost:50929/k8s-demo-image
