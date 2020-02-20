# Static

## Storage

```sh
sudo install -dm 777 -o nfsnobody -g nfsnobody /var/share
```

```sh
sudo install -dm 777 -o nfsnobody -g nfsnobody /var/share/pv00{01..12}
```

```sh
for name in $(ls -1 /var/share); do
  cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: $name
  labels:
    type: local
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  storageClassName: local
  hostPath:
    path: /var/share/$name
EOF
done
```

## Info

```sh
kubectl get pv
```

```sh
kubectl describe pv/pv0001
```

## Label

```sh
kubectl label nodes/node1 diskType=ssd
```

```sh
kubectl get nodes --show-labels
```
