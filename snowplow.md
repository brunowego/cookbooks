# Snowplow

<!--
https://snowplowanalytics.com/customers/getninjas/
https://github.com/fishtown-analytics/snowplow
https://github.com/mleuthold/snowplow-helm-charts/tree/master/charts
https://github.com/snowplow/snowplow-docker
https://github.com/snowplow-incubator/snowplow-micro
https://github.com/nkt/snowplow-installation
https://github.com/snowplow-incubator/snowplow-google-analytics-plugin
-->

## Docker Swarm

### Dependencies

- [Docker Swarm](/docker-swarm.md#cluster-provision)

```sh
git clone https://github.com/snowplow/snowplow-docker snowplow-docker && cd "$_"

cd ./example
```

### Running

```sh
docker stack deploy -c ./docker-compose.yml snowplow-realtime
```

```sh
# NSQ Admin
echo -e "[INFO]\thttp://$(docker-machine ip manager1):4171"

# NSQ Pubsub
echo -e "[INFO]\thttp://$(docker-machine ip manager1):8081/sub?topic=bad&channel=bad_channel"
```

### Remove

```sh
docker stack rm snowplow-realtime
```
