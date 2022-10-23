# SonarQube Community Edition (CE)

<!--
https://plugins.miniorange.com/saml-single-sign-on-sso-sonarqube-using-simplesaml
https://github.com/BlockByBlock/jenkins-docker-with-goss/blob/master/doc/sonarqube.md
-->

## Links

- [Main Website](https://sonarqube.org)

## References

- [SonarQube Scanner](/sonarsource/sonarqube-scanner.md)
- [SonarQube :: Maven3 Plugin](https://mvnrepository.com/artifact/org.codehaus.sonar/sonar-maven3-plugin)

## Related

- Secret Scanner: Database Connection String

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
  docker.io/library/sonarqube:9.2.4-community
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

### References

- [Configuration](https://github.com/Oteemo/charts/tree/master/charts/sonarqube#configuration)

### Repository

```sh
helm repo add oteemocharts 'https://oteemo.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns sonarqube

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install sonarqube oteemocharts/sonarqube \
  --namespace sonarqube \
  --version 9.6.4 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - name: sonarqube.${DOMAIN}
EOF
)
```

### Status

```sh
kubectl rollout status deploy/sonarqube-sonarqube \
  -n sonarqube
```

### Logs

```sh
kubectl logs \
  -l 'app=sonarqube' \
  -n sonarqube \
  -f
```

### Delete

```sh
helm uninstall sonarqube \
  -n sonarqube

kubectl delete ns sonarqube \
  --grace-period=0 \
  --force
```
