# Configuration

## Web Admin

```sh
sudo sed -i '/^bind_address/s/127.0.0.1/0.0.0.0/g' /opt/couchdb/etc/default.ini
```

```sh
sudo systemctl restart couchdb
```

- [Web Admin](http://[hostname]:5984/_utils/)
