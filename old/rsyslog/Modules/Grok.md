# Grok

## Installation

Add to `./configure` the flag `--enable-mmgrok`

## Configuration

```sh
sudo vim /etc/rsyslog.d/00-mmgrok.conf
```

```conf
module(load="mmgrok")

ruleset(name="grok_rule"){
  action(
    type="mmgrok"
    patterndir="/data/ops/pattern"
    match="%{WORD:test}"
    source="msg"
    target="!msg"
  )
}
```
