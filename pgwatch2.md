# pgwatch2

## Docker

### Links

- [Available env. variables by components](https://github.com/cybertec-postgresql/pgwatch2/blob/master/ENV_VARIABLES.md)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h pgwatch2 \
  -v pgwatch2-config:/pgwatch2/persistent-config \
  -v pgwatch2-grafana-config:/etc/grafana \
  -v pgwatch2-grafana-data:/var/lib/grafana \
  -v pgwatch2-postgresql-data:/var/lib/postgresql \
  -e NOTESTDB='1' \
  -p 3000:3000 \
  -p 8080:8080 \
  --restart='unless-stopped' \
  --name pgwatch2 \
  --network workbench \
  docker.io/cybertec/pgwatch2-postgres:1.8.5
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

| Application | Login | Password |
| --- | --- | --- |
| Grafana | `admin` | `pgwatch2admin` |
| pgwatch2 | `pgwatch2` | `pgwatch2admin` |
| InfluxDB | `root` | `root` |

### Tips

#### Adding Database to Monitor

1. Open pgwatch2 Web UI
2. Add under session "Databases under monitoring"
   - Unique name:
   - DB host:
   - DB dbname:
   - DB user:
   - DB password:
   - Preset metrics config: full

### Remove

```sh
docker rm -f pgwatch2

docker volume rm pgwatch2-config pgwatch2-grafana-config pgwatch2-grafana-data pgwatch2-postgresql-data
```
