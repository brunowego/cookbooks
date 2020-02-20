# Apache Zeppelin

## Helm

### Dependencies

- hadoop

### Install

```sh
helm install stable/zeppelin \
  -n zeppelin \
  --namespace hadoop \
  --set zeppelin.resources.limits.memory=2048Mi \
  --set zeppelin.resources.limits.cpu=1000m \
  --set spark.driverMemory=500mb \
  --set spark.executorMemory=500mb \
  --set hadoop.useConfigMap=true \
  --set ingress.enabled=true \
  --set ingress.hosts={zeppelin.$(minikube ip).nip.io}
```

```sh
kubectl rollout status deploy/zeppelin-zeppelin -n hadoop
```

### Delete

```sh
helm delete zeppelin --purge
```

## Host

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-7-jre
```

#### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk
```

### Installation

#### Linux

```sh
curl https://archive.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz | sudo tar -xzC /opt
sudo ln -s /opt/zeppelin-0.8.1-bin-all /opt/zeppelin
```

### Environment

#### Linux

```sh
sudo tee /etc/profile.d/zeppelin.sh << 'EOF'
export ZEPPELIN_HOME="/opt/zeppelin"
export PATH="$ZEPPELIN_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

### Configuration

#### Linux

```sh
sudo useradd -Mrs /sbin/nologin zeppelin
```

```sh
sudo usermod -aG zeppelin "$USER" && sudo su - "$USER"
```
