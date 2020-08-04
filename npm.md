# Node Package Manager (NPM)

## CLI

### References

- [Shorthands and Other CLI Niceties](https://docs.npmjs.com/misc/config#shorthands-and-other-cli-niceties)
- [The npm config files](https://docs.npmjs.com/files/npmrc)

### Installation

Included in [Node.js](/nodejs.md) package installers.

### Configuration

```sh
npm config list
```

#### Save Prefix

```sh
npm config set save-prefix='~'

npm config get save-prefix
```

#### Registry

```sh
npm config set registry='https://registry.example.com/'

npm config get registry
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

#
npm config get http-proxy
npm config get https-proxy

# delete
npm config delete http-proxy
npm config delete https-proxy
```

### Issues

#### Write Permissions

Try use [Node version management (n)](/n.md) instead.

##### For `/usr/lib`

```log
Error: EACCES: permission denied, access '/usr/lib/node_modules'
```

```sh
#
sudo mkdir -p /usr/lib/node_modules

sudo chown -R "$USER" /usr/lib/node_modules
```

##### For `/usr/local/lib`

```log
npm WARN checkPermissions Missing write access to /usr/local/lib
```

```sh
#
sudo chown -R "$USER" /usr/local

#
sudo mkdir /usr/local/lib/node_modules

sudo chown -R "$USER" /usr/local/lib/node_modules
```

##### For `/usr/bin`

```log
Error: EACCES: permission denied, symlink '../lib/node_modules/[package]/bin/[package]' -> '/usr/bin/[package]'
```

```sh
sudo npm install -g [package]
```

### Uninstall

```sh
rm -fR ~/.npm
```
