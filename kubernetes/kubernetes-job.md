# Kubernetes Job

TODO

<!-- ## CLI

```sh
#
kubectl get job -A

#
cat << EOF | kubectl apply \
  -n $ \
  -f -
apiVersion: batch/v1
kind: Job

EOF
```

#
cat << EOF | kubectl apply \
  -n $ \
  -f -
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: my-cronjob
  labels:
    app: my-cronjob
    keel.sh/policy: force
    keel.sh/trigger: webhooks
spec:
  schedule: "0 */2 * * *"
  failedJobsHistoryLimit: 1
  successfulJobsHistoryLimit: 1
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: my-cronjob
            image: ghcr.io/my-org/my-cronjob
            imagePullPolicy: Always
            command:
            - /bin/sh
            - -c
            - /scripts/test.sh
            envFrom:
              - configMapRef:
                  name: my-cronjob
              - secretRef:
                  name: my-cronjob
            resources:
              requests:
                memory: 50Mi
                cpu: 50m
          restartPolicy: Never
          terminationGracePeriodSeconds: 5
          securityContext:
            runAsUser: 0
          imagePullSecrets:
          - name: docker-registry
EOF
```

-->
