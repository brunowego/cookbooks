# Commands

## Catalog

```sh
curl -X GET "http://127.0.0.1:5000/v2/_catalog"
```

## Repository

### List

```sh
curl -X GET "http://127.0.0.1:5000/v2/[name]/tags/list"
```

## Delete

```sh
curl -X DELETE "http://127.0.0.1:5000/v2/repositories/[name]/tags/[tag]"
```

## Test

```sh
docker pull docker.io/library/alpine:3.9
docker tag docker.io/library/alpine:3.9 127.0.0.1:5000/library/alpine:3.9
docker push 127.0.0.1:5000/library/alpine:3.9
```

```sh
cat << EOF > Dockerfile
FROM 127.0.0.1:5000/library/alpine:3.9

EOF
```
