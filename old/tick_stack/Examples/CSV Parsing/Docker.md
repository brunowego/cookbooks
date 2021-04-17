# Docker

## Volume

```sh
docker volume create example-influxdb-data
docker volume create example-influxdb-config
docker volume create example-telegraf-config
docker volume create example-chronograf-data
```

## Running

```sh
docker run -d \
  -h influxdb \
  -v example-influxdb-data:/var/lib/influxdb \
  -v example-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name example-influxdb \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h telegraf \
  -v example-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name example-telegraf \
  telegraf:1.10-alpine
```

```sh
docker exec -i example-telegraf /bin/sh << EOSHELL
cat << EOF >> /tmp/data.csv
"ComputerName","UserName","ProcessName","Id","Time","IsOpen"
"Computer1","User1","Adobe Desktop Service","11524","3.5.2019 12.17.00","1"
"Computer2","User1","Adobe Desktop Service","11524","3.5.2019 14.17.59","0"
"Computer3","User1","Adobe Desktop Service","11524","3.5.2019 14.17.59","0"
"Computer4","User1","Adobe Desktop Service","11524","3.5.2019 14.17.59","0"
"Computer5","User1","Adobe Desktop Service","11524","3.5.2019 14.17.59","0"

EOF
EOSHELL
```

```sh
docker exec -i example-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  debug = true

[[inputs.tail]]
  files = ["/tmp/data.csv"]
  from_beginning = true
  data_format = "csv"
  csv_header_row_count = 1
  csv_trim_space = true
  csv_tag_columns = ["ComputerName", "UserName", "ProcessName"]

[[outputs.influxdb]]
  urls = ["http://example-influxdb:8086"]

EOF
EOSHELL
```

```sh
docker restart example-telegraf
```

```sh
docker run -d \
  -h chronograf \
  -v example-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name example-chronograf \
  chronograf:1.7-alpine --influxdb-url=http://example-influxdb:8086
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

## Remove

```sh
docker rm -f example-influxdb example-telegraf example-chronograf
docker volume rm example-influxdb-data example-influxdb-config example-telegraf-config example-chronograf-data
```
