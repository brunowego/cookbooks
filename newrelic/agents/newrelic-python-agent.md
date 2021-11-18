# New Relic Python Agent

## Links

- [Code Repository](https://github.com/newrelic/newrelic-python-agent)
- [Docs](https://docs.newrelic.com/docs/apm/agents/python-agent/)

## CLI

### Installation

#### pip

```sh
pip install newrelic
```

### Commands

```sh
newrelic-admin help
```

### Configuration

#### Using Config File

```sh
#
export NEW_RELIC_LICENSE_KEY=''
export NEW_RELIC_CONFIG_FILE='./newrelic.ini'

#
newrelic-admin generate-config "$NEW_RELIC_LICENSE_KEY" "$NEW_RELIC_CONFIG_FILE"
newrelic-admin validate-config "$NEW_RELIC_CONFIG_FILE"
```

<!--
# license_key = REDACTED
-->

#### Using Environment Variables

```sh
export NEW_RELIC_LICENSE_KEY=''
export NEW_RELIC_NO_CONFIG_FILE='true'
export NEW_RELIC_APP_NAME='my-app'
export NEW_RELIC_DISTRIBUTED_TRACING_ENABLED='true'
```

### Usage

```sh
#
newrelic-admin run-program [...]
```

### Tips

#### Django

```sh
newrelic-admin run-program python /app/manage.py collectstatic --noinput
newrelic-admin run-program python /app/manage.py migrate app
newrelic-admin run-program /usr/local/bin/gunicorn wsgi:app \
  --workers 5 \
  --threads 2 \
  --bind 0.0.0.0:8000 \
  --chdir /app
```

## Library

TODO
