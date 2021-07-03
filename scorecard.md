# Security Scorecards (a.k.a. Scorecard)

## Links

- [Code Repository](https://github.com/ossf/scorecard)

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L \
  'https://github.com/ossf/scorecard/releases/download/v2.0.0/scorecard_2.0.0_darwin_x86_64.tar.gz' | \
    tar -xzC /usr/local/bin scorecard
```

#### Linux Binary

```sh
curl \
  -L \
  'https://github.com/ossf/scorecard/releases/download/v2.0.0/scorecard_2.0.0_Linux_x86_64.tar.gz' | \
    tar -xzC /usr/local/bin scorecard
```

### Commands

```sh
scorecard -h
```

### Usage

```sh
#
export GITHUB_AUTH_TOKEN=''

#
scorecard \
  --repo 'github.com/kubernetes/kubernetes'

#
scorecard \
  --repo 'github.com/kubernetes/kubernetes' \
  --checks Frozen-Deps \
  --show-details
```
