# Tips

## Disk Usage

```sh
docker-machine ssh default sudo df -h
```

## Static IP

```sh
cat << EOF | docker-machine ssh default sudo tee /var/lib/boot2docker/bootsync.sh > /dev/null
ifconfig eth1 10.100.1.100 netmask 255.255.255.0 broadcast 10.100.1.255 up
ip route add default via 10.100.1.1
EOF
```

```sh
docker-machine restart default
```

```sh
docker-machine regenerate-certs default -f
```

```sh
docker-machine env default
```
