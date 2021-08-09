# Kubernetes Persistent Volume (PV)

## Issues

### PVC Attached Volume on AWS

```log
Warning  FailedAttachVolume  34s   attachdetach-controller  Multi-Attach error for volume "pvc-9dbdb7f1-850d-4553-97cf-90f88ead73ca" Volume is already exclusively attached to one node and can't be attached to another
```

1. Access [Elastic Block Store - Volumes](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Volumes:sort=desc:createTime)
2. Filter by `tag:kubernetes.io/created-for/pvc/name : `
3. Select -> Actions -> Detach Volume
