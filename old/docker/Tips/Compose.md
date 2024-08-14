# Compose

## TBD

```yml
---
services:
  example:
    entrypoint: /bin/sh
    command: -c '[command]'
```

## TBD

```yml
---
services:
  example:
    entrypoint: ['/bin/sh', '-c', '[command]']
```

## TBD

```yml
---
services:
  example:
    entrypoint:
      - /bin/sh
      - -c
      - [command]
```

## TBD

```yml
---
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
---
services:
  example:
    entrypoint: >
      /bin/sh -c '[command]'
```

## Linebreaks

```yml
---
services:
  example:
    entrypoint: |
      /bin/sh \
        -c '[command]'
```
