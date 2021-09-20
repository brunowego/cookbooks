# New Relic

<!--
https://www.youtube.com/watch?v=OOc8iN9dWfw
-->

## Links

- [New Relic University](https://learn.newrelic.com/)

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

### Usage

```sh
#
newrelic profiles add \
  -n 'tutorial' \
  --apiKey '<API_KEY>' \
  -r 'us'

#
newrelic profiles default \
  -n 'tutorial'

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

<!-- ### Tips

####

1. Alerts & AI
2. Policies

Notification Channels -->
