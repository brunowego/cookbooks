# RStudio

<!--
https://github.com/gadenbuie/drake-rstudio-jobs-example
-->

## App

### Dependencies

- [R Project](/r-project.md)

### Installation

#### Homebrew

```sh
brew cask install rstudio
```

### Running

```sh
open -a /Applications/RStudio.app
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rstudio \
  -e DISABLE_AUTH=true \
  -p 8787:8787 \
  --name rstudio \
  docker.io/rocker/rstudio:3.6.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8787'
```

### Remove

```sh
docker rm -f rstudio
```
