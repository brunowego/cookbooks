# Bash (Unix shell)

## References

- [Bash Guide](https://github.com/Idnan/bash-guide)

## CLI

### Installation

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

#### Homebrew

```sh
brew install bash
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
