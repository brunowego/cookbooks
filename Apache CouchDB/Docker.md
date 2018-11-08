# Docker

## Running

```sh
docker run -d \
  -h couchdb \
  -e COUCHDB_USER=admin \
  -e COUCHDB_PASSWORD='Pa$$w0rd!' \
  -p 5984:5984 \
  --name couchdb \
  --restart always \
  couchdb:2.3
```
