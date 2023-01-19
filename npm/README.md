# Node Package Manager (NPM)

**Keywords:** Node.js Package Manager

## Links

- [npm trends](https://npmtrends.com/git-hooks-vs-husky-vs-pre-commit)
- [Status Page](https://status.npmjs.org/)

## CLI

### References

- [Shorthands and Other CLI Niceties](https://docs.npmjs.com/misc/config#shorthands-and-other-cli-niceties)
- [The npm config files](https://docs.npmjs.com/files/npmrc)

### Installation

Included in [Node.js](/nodejs.md) package installers.

### Configuration

```sh
echo '/node_modules' >> ./.gitignore
```

### Commands

```sh
npm -h

#
npm help 7 config
```

### Execute

```sh
#
npx <command>
```

### Bootstrap

```sh
#
npm init -y; npm i

#
npm init private; npm i
```

#### Recommended

- [commitlint](/commitlint.md)
- [lint-staged](/lint-staged.md)
- [husky](/husky.md)

### Usage

```sh
# List
npm config list

# Save Prefix
npm config set save-prefix '~'
npm config get save-prefix

# Registry
npm config set registry 'https://registry.domain.tld/'
npm config get registry

# License
npm config set init-license 'MIT'
npm config set init-license 'UNLICENSED'
npm config set init-license 'COPYRIGHT'

#
npm pack

#
npm root -g

#
npm list -g

#
npm get prefix

# Clean Install
npm ci
```

### Tips

#### Move `node_modules` to Trash

**Dependencies:** [trash](/trash.md)

```sh
#
find . -name 'node_modules' -type d -prune | xargs du -chs

#
find . -name 'node_modules' -type d -prune -exec trash '{}' +
```

#### Add Type Module

**Refer:** `./package.json`

```json
{
  // ...
  "type": "module"
  // ...
}
```

#### Visual Studio Code

##### Exclude from Files

```sh
jq '."files.exclude"."./**/node_modules" |= true' "$PWD"/.vscode/settings.json | \
  sponge "$PWD"/.vscode/settings.json
```

##### Exclude from Search

```sh
jq '."search.exclude"."**/node_modules" |= true' "$PWD"/.vscode/settings.json | \
  sponge "$PWD"/.vscode/settings.json
```

#### Inherit Node Environment

**Refer:** `./package.json`

```json
{
  "scripts": {
    "build": "NODE_ENV=${NODE_ENV:-prod} node ./index.js"
  }
}
```

#### Set Specific Version

```sh
npm install -g npm@6.14.15
```

#### iCloud No Sync

```sh
find . -name node_modules -exec touch {}/.nosync \;
```

#### Run Commands

```sh
# Globally
echo 'save-prefix = ~' >> ~/.npmrc

# Locally
echo 'save-prefix = ~' >> ./.npmrc
```

#### Update Only Package Lock

```sh
npm i --package-lock-only
```

#### Command-line completion

```sh
# Using Antigen
antigen bundle npm
```

#### Log Level

```sh
npm i --loglevel verbose
```

#### Download Tarball

```sh
wget $(npm view [package-name] dist.tarball)
```

#### Link

```sh
cd /go/to/first-project
npm link

cd /go/to/second-project
npm link [first-project-name]
```

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

#### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
cat << EOF >> ./.gitattributes
/package-lock.json -diff
/package-lock.json linguist-generated=true
EOF
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
Error: EACCES: permission denied, symlink '../lib/node_modules/<package>/bin/<package>' -> '/usr/bin/<package>'
```

```sh
sudo npm install <package> -g
```

### Uninstall

```sh
rm -fR ~/.npm
```

## Dockerfile

### Image

```sh
cat << EOF > ./default.conf
server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }

    location /server_status {
        stub_status;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}
EOF
```

```Dockerfile
FROM docker.io/library/node:13.5.0-alpine AS build

WORKDIR /usr/src/app

RUN apk add -q --no-cache -t .build-deps \
      <package>==<version>

COPY ./package*.json ./

RUN npm i

RUN apk del --purge .build-deps

COPY ./ ./

RUN npm run build


FROM docker.io/library/nginx:1.17.5-alpine

COPY ./default.conf /etc/nginx/conf.d

COPY --from=build /usr/src/app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```
