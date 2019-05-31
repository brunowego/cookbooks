# Tips

##

```sh
#! /bin/sh

while ! curl -f 'http://consul:8500/v1/agent/self'; do sleep 10; done

echo 'Ready!'
```

##

```sh
curl \
  -X PUT \
  -H 'Content-Type: application/json' \
  -d '{
      "name": "superset-service",
      "address": "superset",
      "id": "superset1",
      "port": 8088,
      "tags": [
        "openlmis-service"
      ],
      "check": {
        "http": "http://superset:8088/login",
        "method": "GET",
        "interval": "30s",
        "timeout": "10s"
      }
    }' \
  http://consul:8500/v1/agent/service/register
```

```sh
curl \
  -X PUT \
  -d '{
      "upstream": "superset-service",
      "enable_basic_auth": false,
      "enable_ssl": false,
      "ssl_cert": "/config/nginx/tls/superset.local.crt",
      "ssl_key": "/config/nginx/tls/superset.local.key",
      "ssl_cert_chain": "/config/nginx/tls/superset.local.crt"
    }' \
  http://consul:8500/v1/kv/resources/superset.local
```
