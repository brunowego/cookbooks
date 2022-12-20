# Gophish

## Links

- [Code Repository](https://github.com/gophish/gophish)
- [Main Website](https://getgophish.com)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='gophish' \
  -e MYSQL_PASSWORD='gophish' \
  -e MYSQL_DATABASE='gophish' \
  -v gophish-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name gophish-mysql \
  --network workbench \
  docker.io/library/mysql:5.6

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h gophish \
  -v gophish-data:/opt/gophish \
  -p 3333:3333 \
  --name gophish \
  --network workbench \
  docker.io/gophish/gophish:latest
```

```sh
#
docker exec -i gophish /bin/sh << EOSHELL
cat << EOF > /opt/gophish/config.json
{
	"admin_server": {
		"listen_url": "0.0.0.0:3333",
		"use_tls": false,
		"cert_path": "gophish_admin.crt",
		"key_path": "gophish_admin.key"
	},
	"phish_server": {
		"listen_url": "0.0.0.0:80",
		"use_tls": false,
		"cert_path": "example.crt",
		"key_path": "example.key"
	},
	"db_name": "mysql",
  "db_path": "gophish:gophish@(gophish-mysql:3306)/gophish?charset=utf8&parseTime=True&loc=UTC",
	"migrations_prefix": "db/db_",
	"contact_address": "admin@example.com",
	"logging": {
		"filename": "",
		"level": ""
	}
}
EOF
EOSHELL

#
docker restart gophish
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3333'
```

```sh
# Get password
docker logs gophish 2>&1 | grep 'Please login with the username'
```

### Remove

```sh
docker rm -f \
  gophish-mysql \
  gophish

docker volume rm \
  gophish-mysql-data \
  gophish-data
```
