# SonarQube

<!--
https://plugins.miniorange.com/saml-single-sign-on-sso-sonarqube-using-simplesaml
https://github.com/BlockByBlock/jenkins-docker-with-goss/blob/master/doc/sonarqube.md
-->

## References

- [SonarQube Scanner](/sonar-scanner.md)
- [SonarQube :: Maven3 Plugin](https://mvnrepository.com/artifact/org.codehaus.sonar/sonar-maven3-plugin)

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
  -h postgres \
  -e POSTGRES_USER='sonarqube' \
  -e POSTGRES_PASSWORD='sonarqube' \
  -e POSTGRES_DB='sonarqube' \
  -v sonarqube-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name sonarqube-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
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
  docker.io/library/sonarqube:7.9.2-community
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f sonarqube-postgres sonarqube

docker volume rm sonarqube-postgres-data sonarqube-conf sonarqube-data sonarqube-logs sonarqube-extensions
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

| Login | Password |
| --- | --- |
| `admin` | `admin` |

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

- [Configuration](https://github.com/helm/charts/tree/master/stable/sonarqube#configuration)

### Install

```sh
kubectl create namespace sonarqube
```

```sh
helm install sonarqube stable/sonarqube \
  --namespace sonarqube \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].name=sonarqube.${INGRESS_HOST}.nip.io"
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n sonarqube
```

```sh
helm upgrade sonarqube stable/sonarqube -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - sonarqube.${INGRESS_HOST}.nip.io
EOF
) <(helm get values sonarqube))
```

#### Remove

```sh
helm upgrade sonarqube stable/sonarqube -f <(yq d <(helm get values sonarqube) ingress.tls)

kubectl delete secret example.tls-secret -n sonarqube
```

### Status

```sh
kubectl rollout status deploy/sonarqube -n sonarqube
```

### Logs

```sh
kubectl logs -l 'app=sonarqube' -n sonarqube -f
```

### DNS

```sh
dig @10.96.0.10 sonarqube.sonarqube.svc.cluster.local +short
nslookup sonarqube.sonarqube.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "sonarqube.${INGRESS_HOST}.nip.io" +short
nslookup "sonarqube.${INGRESS_HOST}.nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret sonarqube \
  -o jsonpath='{.data.admin-password}' \
  -n sonarqube | \
    base64 --decode; echo
```

### Delete

```sh
helm uninstall sonarqube -n sonarqube
kubectl delete namespace sonarqube --grace-period=0 --force
```

## Maven Plugin

### Usage

```sh
#
mvn sonar:sonar \
  -Dsonar.login=[username] \
  -Dsonar.password=[password]

#
mvn sonar:sonar \
  -Dsonar.projectKey=[secret] \
  -Dsonar.host.url=http://127.0.0.1:9000 \
  -Dsonar.login=[hash]

#
mvn clean verify sonar:sonar \
  -Dsonar.projectKey=[secret] \
  -Dsonar.host.url=http://127.0.0.1:9000 \
  -Dsonar.login=[hash]
```

### Issues

<!-- ####

```log
[ERROR] Failed to execute goal org.codehaus.mojo:sonar-maven-plugin:2.6:sonar (default-cli) on project [project-name]: Can not execute SonarQube analysis: Plugin org.codehaus.sonar:sonar-maven3-plugin:7.9.2.30863 or one of its dependencies could not be resolved: Failed to read artifact descriptor for org.codehaus.sonar:sonar-maven3-plugin:jar:7.9.2.30863: Could not transfer artifact org.codehaus.sonar:sonar-maven3-plugin:pom:7.9.2.30863 from/to central (https://repo.maven.apache.org/maven2): Received fatal alert: protocol_version -> [Help 1]
```

TODO -->
