# kubectl-patch

## Usage

```sh
# Resources
kubectl patch deployment \
  coredns \
  -n kube-system \
  -p "$(cat << EOJ | tr -d '\n' | awk '{$1=$1};1'
{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "coredns",
            "resources": {
              "limits": {
                "memory": "340Mi"
              },
              "requests": {
                "cpu": "200m",
                "memory": "140Mi"
              }
            }
          }
        ]
      }
    }
  }
}
EOJ
)"
```
