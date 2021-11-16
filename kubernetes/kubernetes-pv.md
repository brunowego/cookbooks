# Kubernetes Persistent Volume (PV)

## Links

- [Access Modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)

## Guides

- [Change the Reclaim Policy of a PersistentVolume](https://v1-18.docs.kubernetes.io/docs/tasks/administer-cluster/change-pv-reclaim-policy/)

## Usage

```sh
#
kubectl get storageclass
```

## Tips

### Disc Free

```sh
kubectl exec [pod-name] -- df
```

### Change Persistent Volume Reclaim Policy

```sh
kubectl patch pv [name] \
  -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
```

### Make Default

```sh
kubectl patch storageclass [name] \
  -p '{"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

## Issues

### PVC Attached Volume on AWS

```log
Warning  FailedAttachVolume  34s   attachdetach-controller  Multi-Attach error for volume "pvc-9dbdb7f1-850d-4553-97cf-90f88ead73ca" Volume is already exclusively attached to one node and can't be attached to another
```

1. Access [Elastic Block Store - Volumes](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Volumes:sort=desc:createTime)
2. Filter by `tag:kubernetes.io/created-for/pvc/name : `
3. Select -> Actions -> Detach Volume
