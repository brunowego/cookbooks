# Node Package Manager (NPM)

## CLI

### References

- [Shorthands and Other CLI Niceties](https://docs.npmjs.com/misc/config#shorthands-and-other-cli-niceties)
- [The npm config files](https://docs.npmjs.com/files/npmrc)

### Installation

Included in Node.js package installers.

### Configuration

```sh
npm config list
```

#### Save Prefix

```sh
npm config set save-prefix='~'
```

#### Registry

```sh
npm config set registry='https://registry.example.com/'
```

### Commands

```sh
npm -h
```

#### Config

```sh
npm help 7 config
```

### Tips

#### Proxy

```sh
# set
npm config set http-proxy $http_proxy
npm config set https-proxy $https_proxy

# delete
npm config delete http-proxy
npm config delete https-proxy
```

### Uninstall

```sh
rm -fR ~/.npm
```
