# ARC Runner

## Types

```sh
#
kubens gar-system

#
export GITHUB_OWNER='<owner>'
export GITHUB_REPO='<repo>'
```

### Single Runner (Run one time)

```sh
#
cat << EOF | kubectl apply -f -
---
apiVersion: actions.summerwind.dev/v1alpha1
kind: Runner
metadata:
  name: k8s-single-runner
spec:
  # organization: $GITHUB_OWNER
  repository: $GITHUB_OWNER/$GITHUB_REPO
  labels:
    - self-hosted
    - my-custom-runner
  env: []
EOF

#
kubectl get runner

#
kubectl logs \
  -l 'actions-runner-controller/inject-registration-token=true' \
  -f

#
kubectl delete runner k8s-single-runner
```

### Runner Deployment

```sh
#
cat << EOF | kubectl apply -f -
---
apiVersion: actions.summerwind.dev/v1alpha1
kind: RunnerDeployment
metadata:
  name: k8s-runners
spec:
  template:
    spec:
      organization: $GITHUB_OWNER
      # repository: $GITHUB_OWNER/$GITHUB_REPO
      labels:
        - self-hosted
      env: []
EOF

#
kubectl get runnerdeployment

#
kubectl logs \
  -l 'actions-runner-controller/inject-registration-token=true' \
  -f

#
kubectl delete runnerdeployment k8s-runners
```

### Horizontal Runner Autoscaler

```sh
#
cat << EOF | kubectl apply -f -
---
apiVersion: actions.summerwind.dev/v1alpha1
kind: HorizontalRunnerAutoscaler
metadata:
  name: k8s-runners-autoscaler
spec:
  scaleTargetRef:
    kind: RunnerDeployment
    name: k8s-runners
  scaleDownDelaySecondsAfterScaleOut: 300
  minReplicas: 1
  maxReplicas: 10
  metrics:
    - type: TotalNumberOfQueuedAndInProgressWorkflowRuns
      repositoryNames:
        - $GITHUB_REPO
EOF

#
kubectl get horizontalrunnerautoscaler

#
kubectl logs \
  -l 'actions-runner-controller/inject-registration-token=true' \
  -f

#
kubectl delete horizontalrunnerautoscaler k8s-runners-autoscaler
```

## Workflow

```yaml
---
name: Test with Self-hosted Runner

on:
  push:
    branches:
      - main

jobs:
  hello:
    name: Hello
    runs-on: self-hosted
    # runs-on: my-custom-runner
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Hello
        run: |
          echo 'Hello World from self hosted runner!'
```
