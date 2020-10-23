# StreamSets Data Collector (sdc)

<!--
https://www.jowanza.com/blog/2018/9/8/real-time-station-tracking-ford-gobike-and-mapd
https://github.com/kunickiaj/streamsets-microservices-istio
-->

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h streamsets-dc \
  -v sdc-data:/data \
  -p 18630:18630 \
  --name streamsets-dc \
  docker.io/streamsets/datacollector:3.10.0 dc
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:18630'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f streamsets-dc
docker volume rm sdc-data
```
