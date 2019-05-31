# Commands

## Catalog

```sh
curl -X GET http://127.0.0.1:5000/v2/_catalog
```

## Repository

### List

```sh
curl -X GET http://127.0.0.1:5000/v2/[name]/tags/list
```

## Delete

```sh
curl -X DELETE http://127.0.0.1:5000/v2/repositories/[name]/tags/[tag]
```

## Pull

```sh
docker pull [image]
```

## Tag

```sh
docker tag [image] 127.0.0.1:5000/[image]
```

## Push

```sh
docker push 127.0.0.1:5000/[image]
```

## Using

```Dockerfile
FROM 127.0.0.1:5000/[image]
```
