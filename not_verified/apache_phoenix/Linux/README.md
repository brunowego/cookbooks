# Linux

## Dependencies

1. Hadoop
2. HBase

## Installation

```sh
curl https://archive.apache.org/dist/phoenix/apache-phoenix-5.0.0-HBase-2.0/bin/apache-phoenix-5.0.0-HBase-2.0-bin.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/apache-phoenix-5.0.0-HBase-2.0-bin /opt/apache-phoenix
```

## Environment

```sh
sudo tee /etc/profile.d/phoenix.sh << 'EOF'
export PHOENIX_HOME="/opt/apache-phoenix"
export PATH="$PHOENIX_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin phoenix
```

```sh
sudo usermod -aG phoenix "$USER" && sudo su - "$USER"
```
