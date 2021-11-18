# AWS Node Termination Handler

## Links

- [Code Repository](https://github.com/aws/aws-node-termination-handler)

## Issues

### AWS Node Termination Handler

```log
I1117 22:12:42.413880   36776 instancegroups.go:526] Cluster did not pass validation, will retry in "30s": system-node-critical pod "aws-node-termination-handler-gxvt6" is not ready (aws-node-termination-handler), system-node-critical pod "aws-node-termination-handler-tpv77" is not ready (aws-node-termination-handler).
W1117 22:13:15.210571   36776 aws_cloud.go:861] ignoring instance as it is terminating: i-0070aa06941ae3cce in autoscaling group: nodes-us-east-1b.stg01-us-east-1.k8s.local
```

```sh
#
kubectl get pods \
  -l 'app.kubernetes.io/instance=aws-node-termination-handler' \
  -o wide

#
kubectl get pods \
  -l 'app.kubernetes.io/instance=aws-node-termination-handler' \
  -o wide | \
    grep -E 'Error|CrashLoopBackOff'

#
kubectl get pods \
  -l 'app.kubernetes.io/instance=aws-node-termination-handler' \
  --no-headers | \
    awk '{print $1}' | \
      xargs kubectl delete pod
```

### Bad Image

**Issues:** [533](https://github.com/aws/aws-node-termination-handler/issues/533)

```log
standard_init_linux.go:211: exec user process caused "exec format error"
```

```sh
#
watch kubectl get pods \
  -l 'app.kubernetes.io/instance=aws-node-termination-handler' \
  -o wide
```
