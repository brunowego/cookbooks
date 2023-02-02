# skopeo

**Keywords:** Docker registry inspector

## Links

- [Code Repository](https://github.com/containers/skopeo)

## CLI

### Installation

#### Homebrew

```sh
brew install skopeo
```

#### APT

```sh
sudo apt update
sudo apt -y install skopeo
```

#### YUM

```sh
yum check-update
sudo yum -y install skopeo
```

#### APK

```sh
sudo apk update
sudo apk add skopeo
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y skopeo
```

### Commands

```sh
skopeo --help
```

### Usage

```sh
#
skopeo login \
  -u 'brunowego' \
  docker.io

#
skopeo inspect \
  --raw \
  docker://docker.io/ubuntu | \
    jq .

#
skopeo inspect \
  --override-os linux \
  docker://docker.io/ubuntu | \
    jq .
```

### Issues

<!-- ####

```log
FATA[0002] Error parsing manifest for image: Error choosing image instance: no image found in manifest list for architecture amd64, variant "", OS darwin
```

```sh
skopeo inspect \
  --raw \
  # ...
``` -->

#### GitHub Packages Forbidden

```log
FATA[0012] authenticating creds for "ghcr.io": Requesting bear token: invalid status code from registry 403 (Forbidden)
```

Try create a new one [token](https://github.com/settings/tokens).
