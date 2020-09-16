# Bash (Unix shell)

## References

- [Bash Guide](https://github.com/Idnan/bash-guide)

## CLI

### Installation

#### Homebrew

```sh
brew install bash
```

#### YUM

```sh
yum check-update
sudo yum -y install bash
```

#### APK

```sh
sudo apk update
sudo apk add bash
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y bash
```

### Configuration

```sh
# for Linux
sudo chsh "$USER" -s /bin/bash

# for Darwin
sudo chpass -s `which bash` $USER
```

```sh
sudo su - "$USER"
```

```sh
echo $SHELL
```

### Usage

```sh
# Version
bash --version | head -1
```

### Tips

#### Reload

```sh
. ~/.bashrc
```

#### Turn `.bashrc` auto-load automatically

```sh
tee -a ~/.profile << EOF

if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
EOF
```

### Restore

```sh
rm -fR ~/.bashrc
```

```sh
sudo cp /root/.bashrc ~
```

### Issues

#### LDAP Authentication

```log
chsh: user '[username]' does not exist in /etc/passwd
```

TODO

<!-- ####

```sh
echo "${USER}:x:$(id -u):$(id -g):/home/${USER}:${USER}:/bin/bash" | sudo tee -a /etc/passwd
``` -->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h bash \
  --name bash \
  --network workbench \
  docker.io/library/bash:5.0
```
