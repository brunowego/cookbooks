# Compose

## TBD

```yml
version: '3'

services:
  example:
    entrypoint: /bin/sh
    command: -c '[command]'
```

## TBD

```yml
version: '3'

services:
  example:
    entrypoint: ['/bin/sh', '-c', '[command]']
```

## TBD

```yml
version: '3'

services:
  example:
    entrypoint:
      - /bin/sh
      - -c
      - [command]
```

## TBD

```yml
version: '3'

services:
  example:
    entrypoint:
      - /bin/sh
      - -c
      - |-
        [command]
```

## Long String

```yml
version: '3'

services:
  example:
    entrypoint: >
      /bin/sh -c '[command]'
```

## Linebreaks

```yml
version: '3'

services:
  example:
    entrypoint: |
      /bin/sh \
        -c '[command]'
```
