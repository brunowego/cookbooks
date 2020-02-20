# Nexus Repository Composer

## References

- [Nexus Push command for composer](/nexus-composer-push.md)

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nexus-repository-composer \
  -v nexus-repository-composer-data:/nexus-data \
  -p 8081:8081 \
  --name nexus-repository-composer \
  docker.io/jbuncle/nexus-repository-composer:3.19.1
```

> Wait! This process take a while.

```sh
docker exec nexus-repository-composer cat /nexus-data/admin.password; echo
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8081'
```

### Remove

```sh
docker rm -f nexus-repository-composer
docker volume rm nexus-repository-composer-data
```

## Docs

### Create User

1. Server administration and configuration
2. Security
3. Users
4. Create local user

### Create Repository

#### Proxy

1. Server administration and configuration
2. Repositories
3. Create repository
4. composer (proxy)
   - Name: packagist.org-proxy
   - Remote storage: [https://packagist.org](https://packagist.org)
   - Create repository

#### Hosted

1. Server administration and configuration
2. Repositories
3. Create repository
4. composer (hosted)
   - Name: composer-hosted
   - Create repository

#### Group

1. Server administration and configuration
2. Repositories
3. Create repository
4. composer (group)
   - Name: company
   - Group -> Member repositories -> Available -> Select Users -> Add to Selected
   - Create repository

### Configuration

```sh
composer config -l

composer config repo.packagist false

composer config repositories.nexus composer http://127.0.0.1:8081/repository/packagist.org-proxy
composer config secure-http false

composer search monolog
```
