# SonarQube

## Docker

### Volume

```sh
docker volume create sonarqube-postgres-data
docker volume create sonarqube-conf
docker volume create sonarqube-data
docker volume create sonarqube-logs
docker volume create sonarqube-extensions
```

### Running

```sh
docker run -d \
  -h postgres.sonarqube.local \
  -e POSTGRES_USER=sonarqube \
  -e POSTGRES_PASSWORD=sonarqube \
  -e POSTGRES_DB=sonarqube \
  -v sonarqube-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name sonarqube-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h sonarqube.local \
  -e SONARQUBE_JDBC_USERNAME=sonarqube \
  -e SONARQUBE_JDBC_PASSWORD=sonarqube \
  -e SONARQUBE_JDBC_URL='jdbc:postgresql://sonarqube-postgres:5432/sonarqube' \
  -v sonarqube-conf:/opt/sonarqube/conf \
  -v sonarqube-data:/opt/sonarqube/data \
  -v sonarqube-logs:/opt/sonarqube/logs \
  -v sonarqube-extensions:/opt/sonarqube/extensions \
  -p 9000:9000 \
  --name sonarqube \
  --restart always \
  --link sonarqube-postgres \
  sonarqube:7.7-community
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):9000"
```

| Login | Password |
| --- | --- |
| admin | admin |

## Remove

```sh
docker rm -f sonarqube-postgres sonarqube
docker volume rm sonarqube-postgres-data sonarqube-conf sonarqube-data sonarqube-logs sonarqube-extensions
```
