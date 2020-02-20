# Linux

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin superset
```

```sh
sudo usermod -aG superset "$USER" && sudo su - "$USER"
```

```sh
sudo install -dm 775 -o superset -g superset /etc/superset
```

```sh
sudo -u superset echo -e 'import os\n' >> /etc/superset/superset_config.py
```

```sh
sudo install -dm 775 -o superset -g superset /var/lib/superset
```

## Environment

```sh
sudo tee /etc/profile.d/superset.sh << EOF
export SUPERSET_CONFIG_PATH=/etc/superset/superset_config.py
export SUPERSET_HOME=/var/lib/superset
EOF
```

```sh
sudo su - "$USER"
```

## Initialize

```sh
fabmanager create-admin --app superset
```

```sh
superset db upgrade
```

```sh
superset init
```

## Service

### Environment

```sh
sudo tee /etc/sysconfig/superset << EOF
SUPERSET_CONFIG_PATH=/etc/superset/superset_config.py
SUPERSET_HOME=/var/lib/superset
EOF
```
