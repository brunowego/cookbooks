# Jenkins

## Helm

### Dependencies

- nginx-ingress

### Install

```sh
kubectl create namespace jenkins
```

```sh
helm install stable/jenkins \
  -n jenkins \
  --namespace jenkins \
  --set master.serviceType=ClusterIP \
  --set master.ingress.enabled=true \
  --set master.ingress.hostName=jenkins.example.com
```

```sh
kubectl rollout status deploy/jenkins -n jenkins
```

```sh
kubectl get secret jenkins -o jsonpath='{.data.jenkins-admin-password}' -n jenkins | base64 --decode; echo
```

### Delete

```sh
helm delete jenkins --purge
kubectl delete namespace jenkins --grace-period=0 --force
```

## Docker

### Volume

```sh
docker volume create jenkins-data
```

### Running

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
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

### Remove

```sh
docker rm -f jenkins
docker volume rm jenkins-data
```
