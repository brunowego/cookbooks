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
# List
docker volume ls

# Set volume name
export DOCKER_VOLUME_NAME=''

# Find containers using the volume (running only)
CONTAINERS=$(docker ps -q --filter volume="$DOCKER_VOLUME_NAME")

# Stop
docker stop $CONTAINERS

# Backup (before backup, remove old backup)
docker run --rm -v "$DOCKER_VOLUME_NAME":/volume -v $(pwd):/backup alpine tar cvf /backup/backup-$(date -u '+%Y-%m-%d').tar /volume

# Start
docker start $CONTAINERS
```

### Restore

```sh
# List
docker volume ls

# Set volume name
export DOCKER_VOLUME_NAME=''

# Find containers using the volume (running only)
CONTAINERS=$(docker ps -q --filter volume="$DOCKER_VOLUME_NAME")

# Stop
docker stop $CONTAINERS

# Restore
docker run --rm -v "$DOCKER_VOLUME_NAME":/volume -v $(pwd):/backup alpine sh -c "cd /volume && tar xvf /backup/backup-<date>.tar --strip 1"

# Start
docker start $CONTAINERS
```
