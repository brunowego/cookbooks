# GNU Tar

## CLI

### Installation

#### Homebrew

```sh
brew install gnu-tar
```

#### YUM

```sh
yum check-update
sudo yum -y install tar
```

#### APT

```sh
sudo apt update
sudo apt -y install tar
```

#### APK

```sh
sudo apk update
sudo apk add tar
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# GNU tar
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
tar --help
```

### Tips

#### Check type

```sh
file [filename]
```

#### Compress gzip

```sh
tar -czvf [filename].tar.gz [/path/to/directory-or-file]
```

### Issues

#### Permission Denied

```log
tar: Exiting with failure status due to previous errors
```

```sh
tar \
  -czf [filename].tar.gz \
  --exclude='/path/to/folder-or-file' \
  [/path/to/directory-or-file]
```

```sh
tar: path/to/folder-or-file: Cannot open: Permission denied
tar: Exiting with failure status due to previous errors
```
