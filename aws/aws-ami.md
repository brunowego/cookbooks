# AWS Amazon Machine Image (AMI)

## Links

- [Amazon EC2 AMI Locator](https://cloud-images.ubuntu.com/locator/ec2/)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h amazonlinux \
  --name amazonlinux \
  --network workbench \
  docker.io/library/amazonlinux:2 /bin/bash
```
