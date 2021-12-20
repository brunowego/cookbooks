# AWS Amazon Machine Image (AMI)

<!--
EC2 Image Builder

ec2-user
ubuntu
-->

## Links

- [Ubuntu / Amazon EC2 AMI Locator](https://cloud-images.ubuntu.com/locator/ec2/)
- [AWS Console / EC2 / Images / AMIs](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Images:visibility=owned-by-me)

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
