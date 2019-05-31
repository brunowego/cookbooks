# Issues

## Strict permissions

> Exiting: error loading config file: config file ("[beat]") must be owned by the beat user (uid=1000) or root

```yml
version: '3.6'

services:
  beat:
    # [...]
    command: filebeat -e -strict.perms=false
```
