# ForgeRock Access Management

## References

- [Downloads](https://backstage.forgerock.com/downloads/browse/am/latest)

## Docker

### Build

```sh
mkdir -p ./binaries
```

```sh
mv /path/to/AM-eval-6.5.1.zip ./binaries
```

```sh
cat << \EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/forgerock-am -
FROM docker.io/openjdk:8-jre-slim

WORKDIR /usr/local/tomcat

RUN apt update && \
    apt --no-install-recommends -y install gnupg dirmngr curl

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys \
    05AB33110949707C93A279E3D3EFE6B686867BA6 \
    07E48665A34DCAFAE522E5E6266191C37C037D42 \
    47309207D818FFD8DCD3F83F1931D684307A10A5 \
    541FBE7D8F78B25E055DDEE13C370389288584E7 \
    61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
    79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
    9BA44C2621385CB966EBA586F72C284D731FABEE \
    A27677289986DB50844682F8ACB77FC2E86E29AC \
    A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
    DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
    F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
    F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23

ENV TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.5.41

ENV TOMCAT_TGZ_URL https://apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN set -x && \
    curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz && \
    curl -fSL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc && \
    gpg --verify tomcat.tar.gz.asc && \
    tar -xvf tomcat.tar.gz --strip-components 1 && \
    rm bin/*.bat && \
    rm tomcat.tar.gz*

EXPOSE 8080

ENV AM_VERSION 6.5.1

ADD ./binaries/AM-eval-${AM_VERSION}.zip /tmp

RUN unzip /tmp/AM-eval-${AM_VERSION}.zip -d /opt && \
    cp /opt/openam/AM-${AM_VERSION}.war ./webapps/openam.war && \
    rm /tmp/AM-${AM_VERSION}.zip

CMD ["./bin/catalina.sh", "run"]

EOF
```

### Running

```sh
docker run -d \
  -h openam \
  -p 8080:8080 \
  --name openam \
  gcr.io/forgerock-io/openam:6.5.1
```
