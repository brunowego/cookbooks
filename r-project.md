# R Project

<!--
https://github.com/mlr-org/mlr
https://github.com/topepo/caret
https://github.com/sol-eng/tensorflow-w-r
-->

## References

- [Awesome List](https://github.com/qinwf/awesome-R)
- [Machine Learning Pipelines for R](https://cran.r-project.org/web/packages/pipeliner/README.html)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h r-project \
  --name r-project \
  docker.io/rocker/r-ver:3.6.1 /bin/bash
```

## CLI

### Installation

#### Homebrew

```sh
brew install r
```

### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install r-base
```

### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install R
```

## Commands

```sh
R -h
```
