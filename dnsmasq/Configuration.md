# Configuration

```sh
echo 'address=/.dev/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf
```

```sh
echo 'listen-address=127.0.0.1' >> $(brew --prefix)/etc/dnsmasq.conf
```

```sh
echo 'port=35353' >> $(brew --prefix)/etc/dnsmasq.conf
```

```sh
sudo mkdir -v /etc/resolver 
```

```sh
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
```

```sh
sudo bash -c 'echo "port 35353" >> /etc/resolver/dev'
```
