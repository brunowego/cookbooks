# Linux

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install curl git
```

## Installation

```sh
mkdir -p "$GOPATH"/bin
```

```sh
curl "https://raw.githubusercontent.com/golang/dep/master/install.sh" | sh
```
