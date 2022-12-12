# Kubernetes CronJob

## Links

- [Docs](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)

## Custom Resource (CR)

```yml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: my-app-cronjob
spec:
  schedule: 30 * * * *
  failedJobsHistoryLimit: 1
  successfulJobsHistoryLimit: 1
  jobTemplate:
    metadata:
      labels:
        app: my-app
    spec:
      template:
        spec:
          containers:
            - name: my-app
              image: gcr.io/my-corp/my-app:latest
              imagePullPolicy: IfNotPresent
              # command:
              # args:
              # env:
              # - name: MY_ENV
              #   value: my_value
              # envFrom:
              # - configMapRef:
              #     name: my-app-configmap
              # - secretRef:
              #     name: my-app-secrets
              # volumeMounts:
              # - name: config
              #   mountPath: /etc/config
              #   readOnly: true
              # resources:
              #   requests:
              #     cpu: 100m
              #     memory: 30Mi
              #   limits:
              #     cpu: 150m
              #     memory: 50Mi
          restartPolicy: Never
          terminationGracePeriodSeconds: 5
          securityContext:
            runAsUser: 0
          # volumes:
          # - name: config
          #   configMap:
          #     name: config
          # nodeSelector:
          #   Archtype: "x86"
          # imagePullSecrets:
          # - name: docker-registry
```

## Usage

**Note:** Works only with Kubernetes >=1.21.

```sh
#
kubens [namespace]

#
kubectl get cronjobs

#
kubectl describe cronjob [cronjob-name]
kubectl describe job [cronjob-name]

#
kubectl create job --from=cronjob/[cronjob-name] [job-name]

#
kubectl get jobs -o wide
```

## Tips

### Suspend Cronjob

**Tip:** Use [Lens](/lens.md) to force trigger.

```sh
#
kubens [namespace]

#
kubectl patch cronjobs [name] \
  -p '{"spec":{"suspend":true}}'

# Batch Action
kubectl get cronjobs | \
  grep False | \
    cut -d ' ' -f 1 | \
      xargs kubectl patch cronjobs -p '{"spec":{"suspend":true}}'
```

## Issues

### Unknown Object Type

```log
error: unknown object type *v1beta1.CronJob
```

You should upgrade cluster to 1.21, where cronjobs works more or less stable.

### Prune

```log
error: error retrieving RESTMappings to prune: invalid resource batch/v1, Kind=CronJob, Namespaced=true: no matches for kind "CronJob" in version "batch/v1"
```

TODO
