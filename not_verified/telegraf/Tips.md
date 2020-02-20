# Tips

## Config Directory

```sh
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  interval = "10s"

EOF
```

```sh
mkdir -p /etc/telegraf/conf.d
```

```sh
telegraf \
  --config-directory=/etc/telegraf/conf.d
```

```sh
cat << EOF > /etc/telegraf/conf.d/input-system.conf
[[inputs.system]]
[[inputs.cpu]]
[[inputs.mem]]

EOF
```

```sh
cat << EOF > /etc/telegraf/conf.d/output-influxdb.conf
[[outputs.influxdb]]
  urls = ["http://influxdb:8086"]

EOF
```
