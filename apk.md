# Alpine Package Keeper (APK)

## Usage

```sh
# Update
sudo apk update

# Install
sudo apk add [package]

# Without cache
sudo apk add -q --no-cache [package]

# Info
sudo apk info [package]

# Search
sudo apk search [package]

# Upgrade
sudo apk upgrade

# Delete
sudo apk del [package]

# Clean
sudo apk clean all
```

## Tips

### Repositories

```sh
cat << EOF | sudo tee /etc/apk/repositories

EOF
```

### Dockerfile

```Dockerfile
RUN apk add -q --no-cache \
      [package]==[version]
```

```Dockerfile
RUN apk add -q --no-cache -t .build-deps \
      [package]==[version]
RUN apk del --purge .build-deps
```

## Issues

### Lock

```log
ERROR: Unable to lock database: Resource temporarily unavailable
```

```sh
rm /lib/apk/db/lock
```
