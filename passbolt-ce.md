# Passbolt Community Edition (CE)

**Keywords:** Password Manager

## Links

- [Code Repository](https://github.com/passbolt/passbolt_api)
- [Main Website](https://passbolt.com)
- [Community Forum](https://community.passbolt.com/)

## CLI

### Installation

#### Darwin Binary

```sh
PASSBOLT_VERSION="$(curl -s https://api.github.com/repos/passbolt/go-passbolt-cli/releases/latest | grep tag_name | cut -d '"' -f 4 | cut -d '/' -f 2 | tr -d 'v')"; \
  curl \
    -L "https://github.com/passbolt/go-passbolt-cli/releases/download/v${PASSBOLT_VERSION}/go-passbolt-cli_${PASSBOLT_VERSION}_Darwin_x86_64.tar.gz" | \
      tar -xzC /usr/local/bin passbolt
```

### Commands

```sh
passbolt -h
```

### Usage

```sh
#
passbolt configure \
  --serverAddress 'http://127.0.0.1:8080' \
  --userPassword '<password>' \
  --userPrivateKeyFile './passbolt_private.txt'

#
passbolt verify

#
passbolt list folder
passbolt list group
passbolt list resource
passbolt list user
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h passbolt-mailhog \
  -p 1025:1025 \
  -p 8025:8025 \
  --name passbolt-mailhog \
  --network workbench \
  docker.io/mailhog/mailhog:v1.0.1

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h passbolt-mariadb \
  -e MARIADB_ROOT_PASSWORD='root' \
  -e MARIADB_USER='passbolt' \
  -e MARIADB_PASSWORD='passbolt' \
  -e MARIADB_DATABASE='passbolt' \
  -v passbolt-mariadb-data:/var/lib/mysql \
  -p 3306:3306 \
  --name passbolt-mariadb \
  --network workbench \
  docker.io/library/mariadb:10.6

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h passbolt \
  -e PECL_PASSBOLT_EXTENSIONS='redis gnupg xdebug' \
  -e DATASOURCES_DEFAULT_HOST='passbolt-mariadb' \
  -e DATASOURCES_DEFAULT_DATABASE='passbolt' \
  -e DATASOURCES_DEFAULT_USERNAME='passbolt' \
  -e DATASOURCES_DEFAULT_PASSWORD='passbolt' \
  -e PASSBOLT_REGISTRATION_PUBLIC='true' \
  -e EMAIL_TRANSPORT_DEFAULT_HOST='passbolt-mailhog' \
  -e EMAIL_TRANSPORT_DEFAULT_PORT='1025' \
  -v passbolt-config-gpg:/var/www/passbolt/config/gpg \
  -v passbolt-images:/var/www/passbolt/webroot/img/public/images \
  -p 8080:80 \
  -p 8443:443 \
  --name passbolt \
  --network workbench \
  docker.io/passbolt/passbolt:3.7.3-1-ce
```

```sh
# Register
echo -e '[INFO]\thttp://127.0.0.1:8080/users/register'

# Mailbox
echo -e '[INFO]\thttp://127.0.0.1:8025'
```

### Remove

```sh
docker rm -f passbolt-mailhog passbolt-mariadb passbolt

docker volume rm passbolt-mariadb-data passbolt-config-gpg passbolt-images
```
