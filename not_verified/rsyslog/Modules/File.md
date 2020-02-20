# Grok

## Installation

Add to `./configure` the flag `--enable-imfile`

## Configuration

```sh
sudo vim /etc/rsyslog.d/00-imfile.conf
```

```conf
module(load="imfile" PollingInterval="10")

input(type="imfile"
  Ruleset="kafka_rule_nginx_access"
  File="/data/logs/nginx/access.log"
  Tag="nginx_access"
  Severity="info"
  reopenOnTruncate="on"
  addMetadata="on"
  freshStartTail="on"
  escapeLF="on"
)
```
