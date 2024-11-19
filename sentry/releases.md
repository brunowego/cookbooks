# Sentry Releases

## Usage

```sh
#
sentry-cli releases list -P
sentry-cli releases list -p <project-name>

#
sentry-cli releases list -Rp <project-name>

#
sentry-cli releases delete <version>
```

## Tips

###

```sh
#
export SENTRY_PROJECT='<name>'

#
sentry-cli releases list -Rp "$SENTRY_PROJECT" | \
  awk '{print $1}' | \
    xargs -I {} sentry-cli releases delete {}
```
