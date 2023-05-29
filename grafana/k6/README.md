# Grafana K6

<!--
https://github.com/maximilianoalves/k6-arch-example

https://github.com/pagopa/pdv-load-tests/blob/main/src/01-put-tokens.js
-->

**Keywords:** Load Testing

## Links

- [Code Repository](https://github.com/grafana/k6)
- [Main Website](https://k6.io)
- [Demo website for load testing](https://test.k6.io)
- [Docs](https://k6.io/docs)
  - [Installation](https://k6.io/docs/getting-started/installation/)
  - [Running large tests](https://k6.io/docs/testing-guides/running-large-tests/)
  - [Ecosystem Explore](https://k6.io/docs/ecosystem/)
  - [Results output - External outputs](https://k6.io/docs/getting-started/results-output/#external-outputs)

## Glossary

- Test Development Kit

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

### Configuration

```sh
#
k6 login cloud

#
cat ~/Library/Application\ Support/loadimpact/k6/config.json
```

### Usage

```sh
#
k6 status

#
k6 pause

#
k6 resume

#
k6 scale --vus 10

#
k6 stats
```

### Tips

#### Running Script

```sh
#
mkdir -p ./test/stress
```

**Refer:** `./test/stress/index.ts`

```ts
import http from 'k6/http'
import { check } from 'k6'

export let options = {
  vus: 1,
  vusMax: 10,
  duration: '10m',
}

export default function () {
  let res = http.get('http://127.0.0.1:3000')

  check(res, {
    'is status 200': (r) => r.status === 200,
  })
}
EOF
```

```sh
#
k6 run \
  -o influxdb=http://127.0.0.1:8086/k6 \
  ./test/stress/index.ts
```

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
  noUsageReport: true,
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
  docker.io/loadimpact/k6:0.44.1 run \
    --vus 100 \
    --duration 1s \
    --summary-export ./script.json \
    ./script.js
```

### Remove

```sh
docker rm -f k6
```

## Library

### Dependecies

- [InfluxDB](/influxdb/README.md)

### Installation

```sh
# Using pnpm
pnpm add @types/k6 typescript -D
```

### Configuration

```sh
#
mkdir -p ./test/stress
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    // ...
    "stress": "k6 run ./test/stress/index.ts",
    "stress:monitor": "k6 run -o influxdb=http://localhost:8086/k6 ./test/stress/index.ts"
  }
}
```

**Refer:** `./test/stress/index.ts`

```ts
import http from 'k6/http'
import { check } from 'k6'

export default function () {
  let res = http.get('http://127.0.0.1:3000')

  check(res, {
    'is status 200': (r) => r.status === 200,
  })
}
```
