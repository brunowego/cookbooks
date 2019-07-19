# Node Package Manager (NPM)

## References

- [Shorthands and Other CLI Niceties](https://docs.npmjs.com/misc/config#shorthands-and-other-cli-niceties)
- [The npm config files](https://docs.npmjs.com/files/npmrc)

## Installation

Included in Node.js package installers.

## Configuration

```sh
cat << 'EOF' > ~/.npmrc
registry=https://registry.example.com/

EOF
```

```sh
npm config list
```

## Commands

```sh
npm -h
```

### Config

```sh
npm help 7 config
```

## Proxy

### Set

```sh
npm config set http-proxy $http_proxy
npm config set https-proxy $https_proxy
```

### Delete

```sh
npm config delete http-proxy
npm config delete https-proxy
```

## Uninstall

```sh
rm -fR ~/.npm
```
