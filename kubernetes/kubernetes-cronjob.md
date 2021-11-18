# Kubernetes CronJob

## Links

- [Docs](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)

## Usage

```sh
#
kubectl get cronjobs \
  -n [namespace]

#
kubectl get jobs \
  -n [namespace] \
  -o wide
```

## Tips

### Suspend Cronjob

```sh
#
kubectl patch cronjobs [name] \
  -p '{"spec":{"suspend":true}}' \
  -n [namespace]

# Batch Action
kubectl get cronjobs | \
  grep False | \
    cut -d ' ' -f 1 | \
      xargs kubectl patch cronjobs -p '{"spec":{"suspend":true}}'
```
