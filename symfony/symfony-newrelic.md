# Symfony New Relic

TODO

<!-- ## Dockerfile

```sh
cat << \EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/symfony-newrelic -
FROM docker.io/library/php:7.4-alpine

ENV NEWRELIC_VERSION 9.9.0.260

RUN curl \
    -sL "https://download.newrelic.com/php_agent/archive/${NEWRELIC_VERSION}/newrelic-php5-${NEWRELIC_VERSION}-linux-musl.tar.gz" | \
      tar -xzC /usr/lib --transform s/newrelic-php5-${NEWRELIC_VERSION}-linux-musl/newrelic-php5/

EOF
``` -->
