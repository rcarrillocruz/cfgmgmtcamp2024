# Instructions to deploy AWX and EDA locally
1. Install minikube
2. Create minikube cluster: `minikube start --cpus=4 --memory=6g --addons=ingress --extra-config=apiserver.token-auth-file=/etc/ca-certificates/tokens.csv`
3. Create cluster-role admin for token auth: `kubectl apply -f admin-clusterrole.yaml`
4. Install helm
5. Add awx-operator helm repo: `helm repo add awx-operator https://ansible.github.io/awx-operator/`
6. Update helm repos: `helm repo update`
7. Install awx-operator: `helm install -n awx --create-namespace my-awx-operator awx-operator/awx-operator`
8. Create AWX instance: `kubectl apply -f awx.yaml`
9. Get AWX admin secret: `kubectl -n awx get secret awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo`
10. Get AWX url: `minikube service -n awx awx-demo-service --url`
11. Install eda-server-operator: `kubectl apply -f https://github.com/ansible/eda-server-operator/releases/latest/download/operator.yaml`
12. Create EDA instance: `AWX_URL=$(minikube service -n awx awx-demo-service --url) envsubst < eda.yaml | kubectl apply -f -`
13. Get EDA admin secret: `kubectl -n eda-server-operator-system get secret my-eda-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo`

# Instructions to build Decision Environment

`ansible-builder build -f cfgmgmtcamp2024-de.yml -t quay.io/ricarril/cfgmgmtcamp2024-de:latest`