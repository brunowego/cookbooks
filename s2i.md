# Source-To-Image (S2I)

## CLI

### References

- [Build Workflow](https://github.com/openshift/source-to-image#build-workflow)

### Installation

#### Homebrew

```sh
brew install source-to-image
```

#### Linux

```sh
curl -L 'https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz' | sudo tar -xzC /usr/local/bin --strip-components 1 && sudo chmod +x /usr/local/bin/s2i
```

### Commands

```sh
s2i --help
```

### Configuration

#### Build

##### Proxy

```sh
s2i build \
  ...
  -e http_proxy=$http_proxy \
  -e https_proxy=$https_proxy \
  -e no_proxy=$no_proxy \
  --loglevel 1
```

#### Environment

##### Proxy

```sh
mkdir -p ./.s2i
```

```sh
tee -a ./.s2i/environment << EOF
http_proxy=$http_proxy
https_proxy=$https_proxy
no_proxy=$no_proxy
EOF
```
