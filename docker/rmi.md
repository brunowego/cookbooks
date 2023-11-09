# Docker Remove One or More Images (RMI)

## Usage

```sh
#
docker rmi $(docker images -a -q)
```

## Tips

### Remove `<none>` Images

```sh
#
docker images -a | grep none | awk '{ print $3; }' | xargs docker rmi
```
