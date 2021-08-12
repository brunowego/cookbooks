# K6 Operator

## Links

- [Code Repository](https://github.com/grafana/k6-operator)
- [Running distributed k6 tests on Kubernetes](https://k6.io/blog/running-distributed-tests-on-k8s/)

## Kubernetes Manifest

### Dependencies

- Git
- Kustomize
- Kubernetes Control (kubectl)
- GNU Make
- Go Programming Language

### Install

```sh
#
git clone 'https://github.com/grafana/k6-operator' operator && cd "$_"

#
make deploy
```

### Test

```sh
cat << EOF | k6 run -
import http from 'k6/http';
import { Rate } from 'k6/metrics';
import { check, sleep } from 'k6';

const failRate = new Rate('failed_requests');

export let options = {
  stages: [
    { target: 200, duration: '30s' },
    { target: 0, duration: '30s' },
  ],
  thresholds: {
    failed_requests: ['rate<=0'],
    http_req_duration: ['p(95)<500'],
  },
};

export default function () {
  const result = http.get('https://test-api.k6.io/public/crocodiles/');
  check(result, {
    'http response status code is 200': result.status === 200,
  });
  failRate.add(result.status !== 200);
  sleep(1);
}
EOF
```

### Running

```sh
#
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: crocodile-stress-test
data:
  load-test.js: |
    import http from 'k6/http';
    import { Rate } from 'k6/metrics';
    import { check, sleep } from 'k6';

    const failRate = new Rate('failed_requests');

    export let options = {
      stages: [
        { target: 200, duration: '30s' },
        { target: 0, duration: '30s' },
      ],
      thresholds: {
        failed_requests: ['rate<=0'],
        http_req_duration: ['p(95)<500'],
      },
    };

    export default function () {
      const result = http.get('https://test-api.k6.io/public/crocodiles/');
      check(result, {
        'http response status code is 200': result.status === 200,
      });
      failRate.add(result.status !== 200);
      sleep(1);
    }
EOF

#
kubectl describe configmap crocodile-stress-test

#
cat << EOF | kubectl apply -f -
apiVersion: k6.io/v1alpha1
kind: K6
metadata:
  name: k6-sample
spec:
  parallelism: 4
  script:
    configMap:
      name: crocodile-stress-test
      file: load-test.js
EOF

#
kubectl get k6

#
watch kubectl get pods

#
kubectl logs k6-sample

#
kubectl get jobs
```

<!--
verify-username-uniqueness-load-test
-->

<!-- ### Issues

####

```log
Error: failed to create containerd task: failed to create shim: OCI runtime create failed: container_linux.go:380: starting container process caused: exec: "scuttle": executable file not found in $PATH: unknown
```

TODO -->

### Delete

```sh
#
kubectl delete k6 k6-sample

#
kubectl delete configmap crocodile-stress-test

#
make delete
```
