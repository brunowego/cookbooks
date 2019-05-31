# Spark Submit

## Running

### Local instance with 2 threads

```sh
spark-submit \
  --class '[app.name]' \
  --master local[2] \
  [/path/to/spark/app.jar]
```

### Cluster in client mode

```sh
spark-submit \
  --class '[app.name]' \
  --master yarn-client \
  [/path/to/spark/app.jar]
```

### Kerberos

```sh
spark-submit \
  --class '[app.name]' \
  --master yarn \
  --deploy-mode cluster \
  --keytab /etc/security/keytabs/[name].keytab \
  --principal [username]/[FQDN]@[REALM] \
  [/path/to/spark/app.jar]
```
