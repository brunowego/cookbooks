# NFS

## Share

```sh
sudo install -dm 777 -o nfsnobody -g nfsnobody /var/nfs/share
```

```sh
sudo /usr/bin/sh -c 'echo -e "\"/var/nfs/share\" *(rw,no_root_squash,no_subtree_check)" > /etc/exports.d/nfs-slow.exports'
```

```sh
sudo exportfs -ar
```

```sh
sudo systemctl enable --now nfs-server
```

## Test

```sh
showmount -e 127.0.0.1
```

## Storage

```sh
sudo install -dm 777 -o nfsnobody -g nfsnobody /var/nfs/share/pv00{01..12}
```

```sh
export NFS_SERVER=$(hostname -I | awk '{print $1}'); echo $NFS_SERVER
```

```sh
for name in $(ls -1 /var/nfs/share); do
  cat << EOF | kubectl apply -f -
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: $name
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  storageClassName: nfs-slow
  nfs:
    path: /var/nfs/share/$name
    server: $NFS_SERVER
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
