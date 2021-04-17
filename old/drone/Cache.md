# Drone Cache

```sh
docker run -d \
  --env DRONE_REPO=[group/repo] \
  --env DRONE_REPO_BRANCH=develop \
  --env DRONE_COMMIT_BRANCH=develop \

  --env PLUGIN_MOUNT=/drone/bundle \
  --env PLUGIN_RESTORE=false \
  --env PLUGIN_REBUILD=true \

  --env SFTP_CACHE_SERVER=[hostname]:22 \
  --env SFTP_CACHE_PATH=/cache \
  --env SFTP_CACHE_USERNAME=[username] \
  --env SFTP_CACHE_PASSWORD=[password] \
  plugins/sftp-cache
```

```sh
drone secret add --image=plugins/sftp-cache \
 [group/repo] SFTP_CACHE_SERVER [hostname]:22
```

```sh
drone secret add --image=plugins/sftp-cache \
 [group/repo] SFTP_CACHE_PATH /cache
```

```sh
drone secret add --image=plugins/sftp-cache \
 [group/repo] SFTP_CACHE_USERNAME [username]
```

```sh
drone secret add --image=plugins/sftp-cache \
 [group/repo] SFTP_CACHE_PASSWORD [password]
```

```sh
drone secret ls [group/repo]
```

```sh
drone sign [group/repo]
```
