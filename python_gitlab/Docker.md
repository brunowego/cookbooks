# Docker

## Running

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080/profile/personal_access_tokens"
```

```sh
docker run -it --rm \
  -h python-gitlab \
  -e GITLAB_URL='http://$(docker-machine ip):8080' \
  -e GITLAB_PRIVATE_TOKEN='[token]' \
  --name python-gitlab \
  pythongitlab/python-gitlab:latest -h
```
