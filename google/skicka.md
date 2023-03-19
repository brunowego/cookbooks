# skicka

## Links

- [Code Repository](https://github.com/google/skicka)

## CLI

### Installation

```sh
GOBIN=/usr/local/bin go install github.com/google/skicka@latest
```

### Commands

```sh
skicka help
```

### Initialize

```sh
#
skicka init

#
export GOOGLE_CLIENT_ID=''
export GOOGLE_CLIENT_SECRET=''

#
echo -n "$SKICKA_TOKEN_CACHE_JSON" | base64 --decode > ~/.skicka.tokencache.json

sed -i -e "s/;clientid=YOUR_GOOGLE_APP_CLIENT_ID/clientid=$GOOGLE_CLIENT_ID/g" ~/.skicka.config

sed -i -e "s/;clientsecret=YOUR_GOOGLE_APP_SECRET/clientsecret=$GOOGLE_CLIENT_SECRET/g" ~/.skicka.config

#
cat ~/.skicka.config
```

### Usage

```sh
#
skicka ls
```
