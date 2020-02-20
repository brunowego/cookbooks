# Helm

##

```sh
export POD_NAME=$(kubectl get pods -l 'app=vitess,component=vtctld' -o jsonpath='{.items[0].metadata.name}'); echo "$POD_NAME"
```

```sh
nohup kubectl port-forward \
  --address 0.0.0.0 \
  "$POD_NAME" \
  15999:15999 \
  &> /dev/null &
```

```sh
kill -9 "$(lsof -nPi tcp:15999 | grep LISTEN | awk '{print $2}')"
```
