# Flux CD

https://github.com/stefanprodan/gitops-istio
https://github.com/ruzickap/k8s-flagger-istio-flux

## Dependencies

- [Helm Charts](/helm.md)

## Helm

### References

- [Get started with Flux using Helm](https://github.com/fluxcd/flux/blob/master/docs/tutorials/get-started-helm.md)

### Dependencies

- [GitLab CE/EE](/gitlab_ce.md)

### Project

```sh
git clone https://github.com/fluxcd/flux-get-started flux-get-started && cd "$_"
```

```sh
rm -fR ./.git && git init
```

```sh
git config http.sslVerify false
```

```sh
git remote add origin "https://gitlab.example.com/[username]/flux-get-started.git"
```

```sh
sed -i "s|github.com/weaveworks/flux-get-started|gitlab.example.com/[username]/flux-get-started|" ./releases/ghost.yaml
```

```sh
git add -A && git commit -m 'chore(repo): initial commit' && git push
```

### Repository

```sh
helm repo add fluxcd https://charts.fluxcd.io
helm update
```

### Install

```sh
kubectl apply -f https://raw.githubusercontent.com/fluxcd/flux/helm-0.10.1/deploy-helm/flux-helm-release-crd.yaml
```

```sh
kubectl create namespace flux
```

```sh
helm install fluxcd/flux \
  -n flux \
  --namespace flux \
  --set helmOperator.create=true \
  --set helmOperator.createCRD=false \
  --set git.url='git@gitlab.example.com:[username]/flux-get-started' \
  --set git.user='John Doe' \
  --set git.email='jdoe@example.com' \
  --set-string ssh.known_hosts="$(ssh-keyscan gitlab.example.com 2> /dev/null)"
```

### Status

```sh
kubectl rollout status deploy/flux -n flux
```

### Deploy keys

```sh
# using logs
kubectl logs deployment/flux -n flux | grep identity.pub | cut -d '"' -f 2

# using cli
fluxctl identity --k8s-fwd-ns flux
```

```sh
echo -e '[INFO]\thttps://gitlab.example.com/[username]/flux-get-started/-/settings/repository'
```

### Logs

```sh
kubectl logs deployment/flux -n flux -f
```

### Delete

```sh
helm delete flux --purge
kubectl delete namespace flux --grace-period=0 --force
kubectl delete -f https://raw.githubusercontent.com/fluxcd/flux/helm-0.10.1/deploy-helm/flux-helm-release-crd.yaml
```
