# Docker Volume

## Usage

```sh
#
docker volume inspect <volume-name>

#
docker volume rm $(docker volume ls -q)
```

## Tips

### Backup

```sh
# First, stop the container that uses the volume

# List
docker volume ls

# Set volume name
export DOCKER_VOLUME_NAME=''

# Backup
docker run --rm -v "$DOCKER_VOLUME_NAME":/volume -v $(pwd):/backup alpine tar cvf /backup/backup.tar /volume

# Restore
docker run --rm -v "$DOCKER_VOLUME_NAME":/volume -v $(pwd):/backup alpine sh -c "cd /volume && tar xvf /backup/backup.tar --strip 1"
```
