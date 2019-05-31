# Tips

##

```sh
kubectl proxy \
  --accept-hosts='^*$' \
  --address='0.0.0.0'
```

##

### Create

```sh
cat << EOF | kubectl create -f -

EOF
```

### Apply

```sh
cat << EOF | kubectl apply -f -

EOF
```

### Replace

```sh
cat << EOF | kubectl replace --force -f -

EOF
```
