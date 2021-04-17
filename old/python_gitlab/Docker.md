# Docker

## Running

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/profile/personal_access_tokens'
```

```sh
docker run -it --rm \
  -h python-gitlab \
  -e GITLAB_URL='http://127.0.0.1:8080' \
  -e GITLAB_PRIVATE_TOKEN='[token]' \
  --name python-gitlab \
  docker.io/pythongitlab/python-gitlab:latest -h
```
