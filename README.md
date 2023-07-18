# Initial Setup using a Raspberry Pi 4 cluster

Follow [this guide](https://medium.com/thinkport/how-to-build-a-raspberry-pi-kubernetes-cluster-with-k3s-76224788576c) to get the basic nodes set up with k3s.

Or you can execute the scripts of this repository as super-user, e.g. `chmod +x kmaster_setup.sh && sudo ./kmaster_setup.sh`

# Setup Helm

Simply run `sudo ./k3s-init/helm_setup.sh`.

# Installing the provided apps

## Install ArgoCD

Run the following commands:

```
helm repo add argo-cd https://argoproj.github.io/argo-helm
helm dep update argo-cd/
kubectl create namespace argo-cd
helm install -n argo-cd argo-cd argo-cd/
```

### Access ArgoCD GUI

Access the GUI via `kmaster.local:30080`. The user is `admin` and to get the password, run the following command:\
`kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | printf "Password: $(base64 -d)\n"`

# TODOs

- [ ] Create Ansible configuration for new raspberry pi nodes
- [ ] Allow access via domain names such as argocd.kmaster.local or endpoints like kmaster.local/argocd (if that is actually possible)
