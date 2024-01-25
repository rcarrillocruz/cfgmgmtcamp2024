# Instructions to deploy AWX and EDA locally
1. Install minikube
2. `minikube start --cpus=4 --memory=6g --addons=ingress`
3. Install helm
4. `helm repo add awx-operator https://ansible.github.io/awx-operator/`
5. `helm repo update` 
6. `helm install -n awx --create-namespace my-awx-operator awx-operator/awx-operator`
