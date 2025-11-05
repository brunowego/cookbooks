# skopeo

**Keywords:** Docker registry inspector

## Links

- [Code Repository](https://github.com/containers/skopeo)

## CLI

### Installation

```sh
# Using Homebrew
brew install skopeo

# Using APT
sudo apt update
sudo apt -y install skopeo

# Using YUM
yum check-update
sudo yum -y install skopeo

# Using APK
sudo apk update
sudo apk add skopeo

# Using Zypper
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
skopeo list-tags docker://docker.io/library/ubuntu

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
