# Helm

## Namespace

```sh
kubectl create namespace vitess
```

```sh
kubens vitess
```

## Dependencies

- [etcd Operator](https://github.com/coreos/etcd-operator)

## Creating

```sh
kubectl create secret generic vitess-db-password --from-literal=password='vitess123'
```

```sh
git clone https://github.com/vitessio/vitess.git vitess && cd "$_"
```

For the example below we need 6 [persistent volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) pre-created, with `StorageClass` named as `local`.

```sh
kubectl get pv
```

```sh
cat << EOF | helm install helm/vitess -n vitess -f -
topology:
  cells:
    - name: zone1
      keyspaces:
        - name: unsharded_dbname
          shards:
            - name: '0'
              tablets:
                - type: replica
                  vttablet:
                    replicas: 2
        - name: sharded_db
          shards:
            - name: '-80'
              tablets:
                - type: replica
                  vttablet:
                    replicas: 2
            - name: '80-'
              tablets:
                - type: replica
                  vttablet:
                    replicas: 2
      mysqlProtocol:
        enabled: true
        authType: secret
        username: vitess
        passwordSecret: vitess-db-password
      etcd:
        replicas: 3
      vtctld:
        replicas: 1
      vtgate:
        replicas: 3

vttablet:
  dataVolumeClaimSpec:
    storageClassName: local
EOF
```

```sh
vtctlclient -server 127.0.0.1:15999 ApplySchema -sql "$(cat << \EOF
CREATE TABLE `messages` (
  `page` BIGINT(20) UNSIGNED,
  `time_created_ns` BIGINT(20) UNSIGNED,
  `message` VARCHAR(10000),
  PRIMARY KEY (`page`, `time_created_ns`)
);
EOF
)" sharded_db
```

```sh
vtctlclient -server 127.0.0.1:15999 ListAllTablets
```

```sh
vtctlclient -server 127.0.0.1:15999 GetSchema [tablet]
```

```sh
vtctlclient -server 127.0.0.1:15999 ApplyVSchema -vschema "$(cat << EOF
{
  "sharded": true,
  "vindexes": {
    "hash": {
      "type": "hash"
    }
  },
  "tables": {
    "messages": {
      "column_vindexes": [
        {
          "column": "page",
          "name": "hash"
        }
      ]
    }
  }
}
EOF
)" sharded_db
```

```sh
vtctlclient -server 127.0.0.1:15999 GetVSchema sharded_db
```

### Port Forward

```sh
export POD_NAME=$(kubectl get pod -l 'app=vitess,component=vtgate' -o jsonpath='{.items[0].metadata.name}'); echo "$POD_NAME"
```

```sh
nohup kubectl port-forward \
  --address 0.0.0.0 \
  "$POD_NAME" \
  3306:3306 \
  &> /dev/null &
```

#### Stop

```sh
kill -9 "$(lsof -nPi tcp:3306 | grep LISTEN | awk '{print $2}')"
```
