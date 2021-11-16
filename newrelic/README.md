# New Relic

<!--
https://www.youtube.com/watch?v=OOc8iN9dWfw

https://www.udemy.com/course/the-complete-introduction-to-new-relic-one/
https://www.udemy.com/course/new-relic-apm-application-performance-management-for-devops/
https://www.udemy.com/course/learn-new-relic-monitoring-and-devops-for-the-cloud-aws/
-->

## Links

- [New Relic Explorer](https://one.newrelic.com/launcher/)
- [New Relic University](https://learn.newrelic.com/)

## Docs

- [Get started with the New Relic CLI](https://developer.newrelic.com/automate-workflows/get-started-new-relic-cli/)

## Solutions

- APM
- Browser
- Infrastructure
- Insights
- Mobile
- New Relic Logs
- New Relic Serverless for AWS Lambda
- New Relic Traces
- Synthetics

## CLI

### Installation

#### Homebrew

```sh
brew install newrelic-cli
```

### Commands

```sh
newrelic -h
newrelic apm -h
```

### Configuration

```sh
#
newrelic profiles add \
  --profile '[name]' \
  --apiKey '[api-key]' \
  -r 'us'

#
newrelic profiles list

#
newrelic profiles default \
  --profile '[name]'
```

<!--
newrelic profile configure \
  --profile '[name]'
-->

### Usage

```sh
#
newrelic apm application search \
  --name '[app-name]' | \
    jq '.[].name'

#
newrelic entity search \
  --name 'test'

#
newrelic entity tags create \
  --guid 'GUID' \
  --tag '<key>:<value>'

#
newrelic entity tags get \
  --guid 'GUID'
```

### Tips

#### APM Single Delete

```sh
#
export NEWRELIC_API_KEY='[api-key]'
export NEWRELIC_APP_ID=''

curl \
  -X DELETE \
  "https://api.newrelic.com/v2/applications/${NEWRELIC_APP_ID}.json" \
  -H "X-Api-Key:${NEWRELIC_API_KEY}" \
  -i
```

#### APM Multiple Deletion

```sh
#
export NEWRELIC_API_KEY='[api-key]'
export NEWRELIC_APM_APP_NAME=''

#
newrelic apm application search \
  --name "$NEWRELIC_APM_APP_NAME" | \
    jq '.[].name'

#
newrelic apm application search \
  --name "$NEWRELIC_APM_APP_NAME" | \
    jq '.[].applicationId' | \
      xargs -I '{}' curl \
        -X DELETE \
        'https://api.newrelic.com/v2/applications/{}.json' \
        -H "X-Api-Key:${NEWRELIC_API_KEY}" \
        -i
```

<!-- ####

1. Alerts & AI
2. Policies

Notification Channels -->
