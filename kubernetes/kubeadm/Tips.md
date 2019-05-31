# Tips

## Taint Master

```sh
kubectl taint nodes --all node-role.kubernetes.io/master-
```

## Kube Config

```sh
sudo chmod +r /etc/kubernetes/admin.conf
```

```sh
sudo sh -c 'echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> /etc/profile.d/kube.sh'
```

```sh
sudo su - $USER
```
