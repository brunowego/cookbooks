# Bash (Unix shell)

## References

- [Bash Guide](https://github.com/Idnan/bash-guide)

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install bash
```

### APK

```sh
sudo apk update
sudo apk add  bash
```

### Homebrew

```sh
brew install bash
```

## Tips

### Shebang (Unix)

```sh
#! /bin/bash
```

### Turn `.bashrc` auto-load automatically

```sh
sudo vim ~/.profile
```

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

## Restore

```sh
rm -rf ~/.bashrc
```

```sh
sudo cp /root/.bashrc ~
```

## Reload

```sh
source ~/.bashrc
# or
. ~/.bashrc
```
