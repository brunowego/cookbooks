# GLPi (acronym: French: Gestionnaire Libre de Parc Informatique, or "Free IT Equipment Manager" in English)

## Alternatives

- [ERPNext)](/erpnext.md)

## Links

- [Code Repository](https://github.com/glpi-project/glpi)
- [Main Website](https://glpi-project.org/)

## Guides

- [Install wizard](https://glpi-install.readthedocs.io/en/latest/install/wizard.html)

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
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='glpi' \
  -e MYSQL_PASSWORD='glpi' \
  -e MYSQL_DATABASE='glpi' \
  -v glpi-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name glpi-mysql \
  --network workbench \
  docker.io/library/mysql:5.7.23
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h glpi \
  -v glpi-data:/var/www/html/glpi \
  -e VERSION_GLPI='9.5.5' \
  -p 8080:80 \
  --name glpi \
  --network workbench \
  docker.io/diouxx/glpi:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

| Type | Login | Password |
| --- | --- | --- |
| Super Administrator | `glpi` | `glpi` |
| Technical | `tech` | `tech` |
| Help desk | `post-only` | `postonly` |
| Normal | `normal` | `normal` |

### Remove

```sh
docker rm -f glpi-mysql glpi

docker volume rm glpi-mysql-data glpi-data
```
