# H2O

<!--
https://www.jowanza.com/blog/why-h2o-sparkling-water
-->

## Docker

### Running

```sh
docker run -d \
  -h h2o \
  -p 54321:54321 \
  --name h2o \
  docker.io/brunowego/h2o:3.26.0.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:54321'
```

### Remove

```sh
docker rm -f h2o
```

## JAR

### Dependencies

#### Homebrew

```sh
brew cask install java
```

### Running

```sh
wget -O ./tmp.zip http://h2o-release.s3.amazonaws.com/h2o/rel-yau/1/h2o-3.26.0.1.zip && unzip ./tmp.zip && rm ./tmp.zip
```

```sh
( cd ./h2o-3.26.0.1 && java -jar ./h2o.jar )
```
