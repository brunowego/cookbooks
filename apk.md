# Alpine Package Keeper (APK)

## Commands

### Update

```sh
sudo apk update
```

### Install

```sh
sudo apk add [package]
```

#### Without cache

```sh
sudo apk add -q --no-cache [package]
```

### Info

```sh
sudo apk info [package]
```

### Search

```sh
sudo apk search [package]
```

### Upgrade

```sh
sudo apk upgrade
```

### Delete

```sh
sudo apk del [package]
```

### Clean

```sh
sudo apk clean all
```

## Tips

### Dockerfile

```Dockerfile
RUN apk add -q --no-cache [package]==[version]
```

```Dockerfile
RUN apk add -q --no-cache -t .build-deps [package]==[version]
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
