# Intructions to deploy AWX and EDA locally
1. Install minikube
2. Create minikube cluster: `minikube start --cpus=4 --memory=6g --addons=ingress`
3. Install helm
4. Add awx-operator helm repo: `helm repo add awx-operator https://ansible.github.io/awx-operator/`
5. Update helm repos: `helm repo update`
6. Install awx-operator: `helm install -n awx --create-namespace my-awx-operator awx-operator/awx-operator`
7. Create AWX instance: `kubectl apply -f awx.yaml`
8. Get AWX admin secret: `kubectl -n awx get secret awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo`
9. Get AWX url: `minikube service -n awx awx-demo-service --url`
10. Install eda-server-operator: `kubectl apply -f https://github.com/ansible/eda-server-operator/releases/latest/download/operator.yaml`
11. Create EDA instance: `AWX_URL=$(minikube service -n awx awx-demo-service --url) envsubst < eda.yaml | kubectl apply -f -`
12. Get EDA admin secret: `kubectl -n eda-server-operator-system get secret my-eda-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo`
