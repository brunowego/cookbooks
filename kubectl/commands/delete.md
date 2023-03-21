# Kubectl Delete

TODO

## Tips

### Remove Succeeded (Completed) and Failed Pods

```sh
#
kubens <namespace>

#
kubectl delete pod --field-selector=status.phase==Succeeded

#
kubectl delete pod --field-selector=status.phase==Failed
```
