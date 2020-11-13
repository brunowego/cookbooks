# Private Bower

## Configuration

```sh
touch bowerConfig.json || exit
```

```json
{
  "port": 80,
  "registryFile": "/home/private-bower/data/bowerRepository.json",
  "timeout": 144000,
  "public": {
    "disabled": false,
    "registry": "http://bower.herokuapp.com/packages/",
    "registryFile": "/home/private-bower/data/bowerRepositoryPublic.json",
    "whitelist": [],
    "blacklist": []
  },
  "authentication": {
    "enabled": false,
    "key": "password"
  },
  "repositoryCache": {
    "cachePrivate": false,
    "git": {
      "enabled": true,
      "cacheDirectory": "/home/private-bower/data/gitRepoCache",
      "host": "0.0.0.0",
      "port": 6789,
      "publicAccessURL" : "<bower_url>:6789",
      "refreshTimeout": 10
    },
    "svn": {
      "enabled": true,
      "cacheDirectory": "/home/private-bower/data/svnRepoCache",
      "host": "0.0.0.0",
      "port": 7891,
      "publicAccessURL" : "<bower_url>:7891",
      "refreshTimeout": 10
    }
  },
  "proxySettings" : {
    "enabled": false,
    "host": "proxy",
    "username": "name",
    "password" : "pass",
    "port": 8080,
    "tunnel": false
  },
  "log4js" : {
    "enabled": false,
    "configPath" : "log4js.conf.json"
  }
}
```

##### Docker

```sh
touch Dockerfile || exit
```

```dockerfile
FROM docker.io/node:0.10

RUN npm i private-bower -g

EXPOSE 80 6789 7891

VOLUME /home/private-bower/data

WORKDIR /home/private-bower

ADD ./bowerConfig.json /home/private-bower/bowerConfig.json
ADD ./launch.sh /home/private-bower/launch.sh

RUN chmod +x /home/private-bower/launch.sh

CMD ./launch.sh
```

##### Launcher

```sh
touch launch.sh || exit
```

```sh
#! /bin/sh

if [ ! -z "$BOWER_URL" ]; then
	sed -i "s/<bower_url>/$BOWER_URL/g" /home/private-bower/bowerConfig.json
fi

private-bower --config /home/private-bower/bowerConfig.json
```

##### Git

```sh
git init
git add .
git commit -m "Initial commit"
git remote add dokku dokku@ip:private-bower
git push dokku master
```

##### Dokku

```sh
dokku config:set bower BOWER_URL=bower.example.com

dokku volume:create bower /home/private-bower/data
dokku volume:link bower bower
```

#### Bowerrc

```sh
touch .bowerrc || exit
```

```json
{
  "registry": "http://bower.example.com"
}
```
