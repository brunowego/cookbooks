# Helm Repository

## CLI

### Usage

```sh
#
helm repo list

#
helm repo update

#
helm package ./

#
helm repo index \
  --url 'https://charts.<domain>' \
  ./
```

### Tips

#### Remove All Repos

```sh
#
helm repo list | \
  tail -n +2 | \
    awk '{ print $1 }' | \
      xargs helm repo remove
```

Run [Clean Cache](#clean-cache).

#### Clean Cache

```sh
#
rm -fR "$(helm env HELM_REPOSITORY_CACHE)"/*

#
helm repo update
```
