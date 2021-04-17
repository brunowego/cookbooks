# Issues

## Strict permissions

```log
Exiting: error loading config file: config file ("[beat]") must be owned by the beat user (uid=1000) or root
```

```yml
version: '3.7'

services:
  beat:
    # [...]
    command: filebeat -e -strict.perms=false
```
