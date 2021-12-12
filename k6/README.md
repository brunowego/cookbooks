# K6

<!--
https://github.com/mostafa/xk6-kafka
https://github.com/corunet/kloadgen

https://github.com/k6io/docs/blob/edb534e78340799a7082544c79cdc644f88e369e/src/data/markdown/translated-guides/en/04%20Results%20visualization/01%20Amazon%20CloudWatch.md

https://github.com/k6io/operator
https://k6.io/blog/running-distributed-tests-on-k8s/

HTML Report
-->

**Keywords:** Benchmark

## Alternatives

- [Locust](/locust.md)

## Guides

- [Installation](https://k6.io/docs/getting-started/installation/)
- [Running large tests](https://k6.io/docs/testing-guides/running-large-tests/)
- [Ecosystem Explore](https://k6.io/docs/ecosystem/)
- [Results output - External outputs](https://k6.io/docs/getting-started/results-output/#external-outputs)

## Links

- [Demo website for load testing](https://test.k6.io/)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h k6 \
  --name k6 \
  --network workbench \
  docker.io/loadimpact/k6:0.32.0 run \
    --vus 100 \
    --duration 1s \
    --summary-export ./script.json \
    ./script.js
```

### Remove

```sh
docker rm -f k6
```

<!-- ## Library

### Installation

```sh
npm install -D @types/k6 typescript
```

### Configuration

```sh
#
mkdir -p ./test/stress
```

**Refer:** `package.json`

```json
{
  // ...
  "scripts": {
    "stress": "k6 run ./test/stress/index.ts",
    "stress:monitor": "k6 run --out influxdb=http://localhost:8086/dempk6db --out json=./stress.json ./test/stress/index.ts"
  }
}
```

```sh
#
cat << EOF > ./test/stress/index.ts
import http from "k6/http";
import { check } from "k6";

export default function() {
  let res = http.get("https://test.loadimpact.com/");

  check(res, {
    "is status 200": r => r.status === 200
  });
};
EOF
``` -->

## CLI

### Installation

#### Homebrew

```sh
brew install k6
```

#### Linux

```sh
K6_VERSION="$(curl -ks https://api.github.com/repos/k6io/k6/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -L "https://github.com/k6io/k6/releases/download/${K6_VERSION}/k6-${K6_VERSION}-linux-amd64.tar.gz" | \
    sudo tar -xzC '/usr/local/bin' --strip-components 1 && \
      sudo chmod +x '/usr/local/bin/k6'
```

#### YUM

```sh
sudo wget 'https://bintray.com/loadimpact/rpm/rpm' \
  -O '/etc/yum.repos.d/bintray-loadimpact-rpm.repo'

yum check-update
sudo yum -y install k6
```

#### Chocolatey

```sh
choco install k6
```

### Commands

```sh
k6 -h
```

### Usage

```sh
#
mkdir -p ./test/stress
```

```sh
#
cat << EOF > ./test/stress/index.ts
import http from "k6/http";
import { check } from "k6";

export default function() {
  let res = http.get("https://test.loadimpact.com/");

  check(res, {
    "is status 200": r => r.status === 200
  });
};
EOF
```

```sh
#
k6 run \
  --vus 100 \
  --duration 1s \
  --summary-export ./script.json \
  ./test/stress/index.ts

#
k6 run \
  # ..
  --out influxdb=http://localhost:8086/db0 \
  ./test/stress/index.ts
```

<!--
#
TRADER_URL := http://trader.ptcg.10oz.tw
k6 run -e TRADER_URL=$(TRADER_URL) create_order.js

https://github.com/jlobo/stress/blob/main/v1/src/libs/DAuthClientSetError.js
https://github.com/typesense/showcase-songs-search/blob/master/scripts/benchmarking/README.md
https://github.com/firebend/auto-crud/blob/main/Firebend.AutoCrud.Web.Sample.LoadTest/src/scripts/soak.test.js
https://github.com/kyma-project/kyma/blob/main/tests/perf/components/istio/istio.js
https://github.com/shortcut/cloud-native-templates/blob/main/ops/k6/crr.js
https://github.com/SamGreig/derekrose-perf-testing/blob/main/src/steps.js
https://github.com/satheeshpandianj/VolvoCars/blob/main/scripts/WorkloadMix.js
https://github.com/chrispsheehan/PerformanceTestFramework/blob/main/src/crocs.ts
https://github.com/irvanster/k6-loadtesting/blob/main/script.js
https://github.com/HomoEfficio/dev-tips/blob/master/LoadTest-K6-InfluxDB-Grafana.md
https://github.com/arunk2493/k6performancetesting/blob/main/grafana_dashboard.json
-->

### Tips

#### Output

- Apache Kafka
- CSV
- Datadog
- InfluxDB
- JSON
- Load Impact Cloud Platform
- StatsD

### Issues

#### Socket Too Many Open Files

```log
WARN[0001] Request Failed error="Post \"http://localhost:8080/api/v1/widget\": dial tcp 127.0.0.1:8080: socket: too many open files"
```

```sh
ulimit -n 8192
```

#### Not Found

```log
WARN[0001] Request Failed error="Post \"http://localhost:8080/api/v1/widget\": dial tcp 127.0.0.1:8080: connect: connection reset by peer"
```

Probably a "Not Found" response.

#### Usage Report

```log
INFO[0008] 2021/05/26 21:20:13 http2: Transport failed to get client conn for reports.k6.io:443: http2: no cached connection was available
```

```js
export let options = {
  // ...
  noUsageReport: true
}
```

```sh
k6 \
  --no-usage-report \
  # ...
```

Take a [look here](https://k6.io/docs/misc/usage-collection/).

<!-- ####

```log
WARN[0001] Request Failed error="Post \"http://localhost:8080/api/v1/widget\": write tcp 127.0.0.1:52257->127.0.0.1:8080: write: broken pipe"
``` -->

<!-- ####

```log
WARN[0001] Request Failed error="Post \"http://localhost:8080/api/v1/widget\": read tcp 127.0.0.1:52259->127.0.0.1:8080: read: connection reset by peer"
``` -->
