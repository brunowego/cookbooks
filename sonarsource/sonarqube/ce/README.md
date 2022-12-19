# SonarQube Community Edition (CE)

<!--
https://github.com/search?q=filename%3Asonar-project.properties+path%3A%2F
-->

<!--
https://plugins.miniorange.com/saml-single-sign-on-sso-sonarqube-using-simplesaml
https://github.com/BlockByBlock/jenkins-docker-with-goss/blob/master/doc/sonarqube.md
-->

**Keywords:** SAST, Code Quality, Continuous Inspection

## Links

- [Code Repository](https://github.com/SonarSource/sonarqube)
- [Main Website](https://sonarqube.org)

## Docs

- [Decorating Pull Requests](https://docs.sonarqube.org/8.5/analysis/pr-decoration/)
- [Languages](https://docs.sonarqube.org/latest/analysis/languages/overview/)

## References

- [SonarQube Scanner](/sonarsource/sonarqube-scanner.md)
- [SonarQube :: Maven3 Plugin](https://mvnrepository.com/artifact/org.codehaus.sonar/sonar-maven3-plugin)

## Related

- Secret Scanner: Database Connection String

## Glossary

- Application Lifecycle Management (ALM)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='sonarqube' \
  -e POSTGRES_PASSWORD='sonarqube' \
  -e POSTGRES_DB='sonarqube' \
  -v sonarqube-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name sonarqube-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h sonarqube \
  -e SONARQUBE_JDBC_USERNAME='sonarqube' \
  -e SONARQUBE_JDBC_PASSWORD='sonarqube' \
  -e SONARQUBE_JDBC_URL='jdbc:postgresql://sonarqube-postgres:5432/sonarqube' \
  -v sonarqube-conf:/opt/sonarqube/conf \
  -v sonarqube-data:/opt/sonarqube/data \
  -v sonarqube-logs:/opt/sonarqube/logs \
  -v sonarqube-extensions:/opt/sonarqube/extensions \
  -p 9000:9000 \
  --name sonarqube \
  --network workbench \
  docker.io/library/sonarqube:9.7.1-community
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

### Remove

```sh
docker rm -f \
  sonarqube-postgres \
  sonarqube

docker volume rm \
  sonarqube-postgres-data \
  sonarqube-conf \
  sonarqube-data \
  sonarqube-logs \
  sonarqube-extensions
```

## CLI

### Dependencies

#### Homebrew

```sh
brew install openjdk@11
```

### Installation

#### Homebrew

```sh
brew install sonarqube
```

<!-- #### Unix-like

```sh
wget \
  -O /tmp/sonarqube.zip \
  'https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.0.1.46107.zip'

( cd /tmp && unzip ./sonarqube.zip -d /opt && rm ./sonarqube.zip )

ln -s /opt/sonarqube-9.0.1.46107 /opt/sonarqube

export PATH="/opt/sonarqube/bin:$PATH"
``` -->

### Services

```sh
# Homebrew
export JAVA_HOME="$(brew --prefix openjdk@11)"

# Using services
brew services start sonarqube

# Or
sonar start
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

### Commands

```sh
sonar -h
```

### Usage

```sh
# Status
sonar status

# Restart
sonar restart

# Stop
sonar stop

# Or
sonar force-stop

# Console
sonar console

# Dump
sonar dump
```

## Helm

### Dependencies

- Mail Server
  - [MailHog](/mailhog.md#helm) (local)

### References

- [Configuration](https://github.com/SonarSource/helm-chart-sonarqube/tree/master/charts/sonarqube#configuration)

### Repository

```sh
helm repo add sonarqube 'https://sonarsource.github.io/helm-chart-sonarqube'
helm repo update
```

### Install

```sh
#
kubectl create ns sonarqube-system
# kubectl create ns quality-gate

#
helm search repo -l sonarqube/sonarqube

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install sonarqube sonarqube/sonarqube \
  --namespace sonarqube-system \
  --version 5.0.6+370 \
  -f <(cat << EOF
elasticsearch:
  bootstrapChecks: false

ingress:
  enabled: true
  hosts:
    - name: sonarqube.${DOMAIN}
  ingressClassName: nginx

sonarProperties:
  email.from: noreply@sonarqube.${DOMAIN}
  email.smtp_host.secured: mailhog.mailhog-system.svc.cluster.local
  email.smtp_port.secured: 1025
EOF
)

#
kubectl get all -n sonarqube-system
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  -n sonarqube-system \
  svc/sonarqube-sonarqube \
  8080:9000
-->

### Plugins

```sh
#
export SONARQUBE_HELM_CHART_VERSION='5.0.6+370'

#
helm upgrade sonarqube sonarqube/sonarqube \
  -n sonarqube-system \
  --version "$SONARQUBE_HELM_CHART_VERSION" \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values sonarqube -o yaml -n sonarqube-system) <(cat << \EOF
plugins:
  install:
  - https://github.com/cnescatlab/sonar-cnes-report/releases/download/4.1.3/sonar-cnes-report-4.1.3.jar
EOF
))
```

### Status

```sh
kubectl rollout status statefulset/sonarqube-sonarqube \
  -n sonarqube-system
```

### Logs

```sh
kubectl logs \
  -l 'app=sonarqube' \
  -n sonarqube-system \
  -f
```

### Secrets

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

<!--
###

```sh
#
kubectl get statefulset sonarqube-sonarqube \
  -o jsonpath='{.spec.updateStrategy}' \
  -n sonarqube-system; echo

#
kubectl patch statefulset sonarqube-sonarqube \
  -n sonarqube-system \
  -p '{"spec":{"updateStrategy":{"type":"RollingUpdate","rollingUpdate":{"partition":0}}}}'

#
kubectl rollout restart statefulset sonarqube-sonarqube -n sonarqube-system
```
-->

### Delete

```sh
helm uninstall sonarqube \
  -n sonarqube-system

kubectl delete ns sonarqube-system \
  --grace-period=0 \
  --force
```

<!-- ## Makefile

### Configuration

```Makefile
SHELL := /bin/sh

-include ./.env

SONAR_SCANNER ?= sonar-scanner
SONAR_PROJECT_SETTINGS ?= ./sonar-project.properties

.DEFAULT_GOAL := sonar/scanner

.PHONY: sonar/scanner
sonar/scanner:
	@$(SONAR_SCANNER) -Dproject.settings="${SONAR_PROJECT_SETTINGS}" -Dsonar.login="${SONAR_LOGIN_TOKEN}"
``` -->

## Tips

### Disable Update Notification

```log
There’s a new version of SonarQube available. Update to enjoy the latest updates and features.
```

TODO

## Issues

### Upgrade Database

```log
SonarQube is under maintenance
```

Open `<sonarqube-url>/setup` and "Upgrade" the database.

### Global Analysis Token

```log

ERROR: Error during SonarScanner execution
ERROR: You're not authorized to run analysis. Please contact the project administrator.
ERROR:
ERROR: Re-run SonarScanner using the -X switch to enable full debug logging.
The process '/home/vsts/work/_tasks/SonarQubeAnalyze_6d01813a-9589-4b15-8491-8164aeb38055/5.8.0/sonar-scanner/bin/sonar-scanner' failed with exit code 2
```

1. My Account
2. Security -> Tokens
3. Generate Tokens
   - Set Name
   - Type: Global Analysis Token
   - Set Expires in
   - Generate

### Limited Ingress Body Size

```log
12:45:09.236 ERROR: Error during SonarScanner execution
java.lang.IllegalStateException: Failed to upload report: Fail to request url: https://<domain>/api/ce/submit?projectKey=<secret>&projectName=<secret>
	...
Caused by: java.lang.IllegalStateException: Fail to request url: https://<domain>/api/ce/submit?projectKey=<secret>&projectName=<secret>
	...
Caused by: okhttp3.internal.http2.StreamResetException: stream was reset: NO_ERROR
	...
	Suppressed: okhttp3.internal.http2.StreamResetException: stream was reset: NO_ERROR
		...
```

<!--
https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/nginx-configuration/annotations.md
-->

```sh
#
kubectl patch ingress/<name> \
  -n <namespace> \
  -p '{"metadata":{"annotations":{"nginx.ingress.kubernetes.io/proxy-body-size":"32m"}}}'
```
