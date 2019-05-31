# Docker

## Volume

```sh
docker volume create jenkins-data
```

## Running

```sh
docker run -d \
  -h jenkins \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 8080:8080 \
  -p 50000:50000 \
  --name jenkins \
  --restart always \
  jenkins/jenkins:lts
```

```sh
docker exec -i jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

## Remove

```sh
docker rm -f jenkins
docker volume rm jenkins-data
```
