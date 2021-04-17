# Backup

## Directory to Backup

```sh
docker exec --rm \
  --volumes-from [container] \
  -v $(pwd):/backup \
  ubuntu:18.10 tar -cvf /backup/backup.tar /data
```

## Restore to Directory

```sh
docker exec --rm \
  --volumes-from [container] \
  -v $(pwd):/backup \
  ubuntu:18.10 /bin/bash -c "cd /data && tar -xvf /backup/backup.tar --strip 1"
```
