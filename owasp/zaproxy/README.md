# OWASP Zed Attack Proxy (ZAP)

<!--
https://www.youtube.com/watch?v=YDijuX-MyWY
-->

<!--
(^|^[^:]+:\/\/|[^\.]+\.)subdomain\.example\.com.*
-->

<!--
https://app.pluralsight.com/paths/skill/web-application-scanning-with-owasp-zap
https://app.pluralsight.com/library/courses/owasp-zap-web-app-pentesting/table-of-contents
-->

**Keywords:** DAST, Web Scanner

## Links

- [Code Repository](https://github.com/zaproxy/zaproxy)
- [Main Website](https://zaproxy.org/)
- [Download](https://zaproxy.org/download/)

## Test Sites

- [Test site for Acunetix WVS](http://testphp.vulnweb.com)

## Glossary

- Hyper SQL Database (HSQLDB)
- Web Vulnerability Scanner (WVS)

## Main Features

- Spider
- Passive Scan / Active Scan
- Fuzzing
- Reports
- Dynamic SSL Certificates

## App

### Dependencies

- [PhantomJS](/phantomjs.md)

### Installation

#### Homebrew

```sh
brew install --cask owasp-zap
```

### Tips

#### Dark Mode

1. Tools -> Options...
2. Options -> Display -> Look and Feel: Select Flat Dark

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Commands

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zaproxy \
  --name zaproxy \
  --network workbench \
  docker.io/owasp/zap2docker-stable:2.12.0 zap.sh -h

# Full Scan
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zaproxy \
  --name zaproxy \
  --network workbench \
  docker.io/owasp/zap2docker-stable:2.12.0 zap-full-scan.py -h
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zaproxy \
  -p 8080:8080 \
  --name zaproxy \
  --network workbench \
  docker.io/owasp/zap2docker-stable:2.12.0 zap.sh \
    -daemon \
    -config 'api.disablekey=true' \
    -config 'api.addrs.addr.name' \
    -config 'api.addrs.addr.regex=true' \
    -host '0.0.0.0' \
    -port 8080
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

#### Full Scan

```sh
#
mkdir -p ./.zap/reports

#
cat << EOF > ./.zap/rules.tsv
10015	IGNORE	(Incomplete or No Cache-control and Pragma HTTP Header Set)
10027	IGNORE	(Information Disclosure - Suspicious Comments)
10104	IGNORE	(User Agent Fuzzer)
10109	IGNORE	(Modern Web Application)
EOF

#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zaproxy \
  -v "$PWD":/zap/wrk/:rw \
  --name zaproxy \
  --network workbench \
  docker.io/owasp/zap2docker-stable:2.12.0 zap-full-scan.py \
    -t 'https://qa.us.dellexpertprogram.com' \
    -c ./.zap/rules.tsv \
    -r ./.zap/reports/results.html \
    -w ./.zap/reports/results.md \
    -J ./.zap/reports/results.json \
    -d
```

<!--
#### Web Swing

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zaproxy \
  -p 8080:8080 \
  --name zaproxy \
  --network workbench \
  docker.io/owasp/zap2docker-stable:2.12.0 zap-webswing.sh
```
-->

### Remove

```sh
docker rm -f zaproxy
```
