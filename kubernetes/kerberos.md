# Kubernetes Kerberos

TODO

<!-- ##

```sh
kubectl get cm \
  -n big-deploy \
  test-keytab \
  -o yaml
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
binaryData:
  test.keytab: BQIAAABMAAEAD1BST0RIV0JCLkNPTS5CUgAKYmlndGVzdGUwMQAAAAFb8umlAgASACA26/mwj9sCV7HDWTdFon9ixR1D7tLJHJwnRUQouTs6EgAAADwAAQAPUFJPREhXQkIuQ09NLkJSAApiaWd0ZXN0ZTAxAAAAAVvy6aUCABEAEKAJl2jWj3VeiuAdqaeue6YAAABEAAEAD1BST0RIV0JCLkNPTS5CUgAKYmlndGVzdGUwMQAAAAFb8umlAgAQABjaXkqPwQ5KfAGYhoAf4D49hozvbYACivgAAAA8AAEAD1BST0RIV0JCLkNPTS5CUgAKYmlndGVzdGUwMQAAAAFb8umlAgAXABART4E9Pwr6iahKuOjrJET/
kind: ConfigMap
metadata:
  name: test-keytab
  namespace: big-deploy
EOF
``` -->
