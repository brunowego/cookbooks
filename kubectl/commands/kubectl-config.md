# kubectl-config

## Usage

```sh
#
kubectl config view
kubectl config view --raw
```

## Tips

### Rename Context

```sh
kubectl config rename-context <old-context-name> <new-context-name>
```

### Add Cluster

```sh
#
kubectl config set-cluster <cluster-name> \
  --server <URL> \
  --certificate-authority /etc/kubernetes/pki/ca.crt \
  --embed-certs=true \
  --kubeconfig ./<username>.conf

#
kubectl config set-credentials <username> \
  --client-key ./<username>.key \
  --client-certificate ./<username>.crt \
  --embed-certs=true \
  --kubeconfig ./<username>.conf

#
kubectl config set-context <username>@<cluster-name> \
  --cluster <cluster-name> \
  --user <username> \
  --kubeconfig ./<username>.conf

#
kubectl config get-contexts

#
kubectl config use-context \
  <username>@<cluster-name> \
  --kubeconfig ./<username>.conf

#
kubectl cluster-info
```

### Delete Cluster

```sh
kubectl config delete-context <context-name>
kubectl config delete-cluster <cluster-name>
kubectl config unset users.<name>
```

### Testing User

```sh
#
sudo useradd -m <name>

#
sudo mkdir -p /home/<name>/.kube
sudo cp -i <name>.conf /home/<user>/.kube/config

#
sudo chown -R <name>:<name> /home/<name>/.kube

#
sudo su <name>

#
kubectl config view
kubectl get pods -v 6
```

### Extract Certificate

```sh
#
kubectl config view \
  --raw \
  -o jsonpath='{.users[*].user.client-certificate-data}' | \
    base64 -d > ./admin.crt

#
openssl x509 \
  -in ./admin.crt \
  -text \
  -noout | \
    head
```
