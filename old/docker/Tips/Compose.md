# Compose

##

```yml
version: '3.7'

services:
  example:
    entrypoint: /bin/sh
    command: -c '[command]'
```

##

```yml
version: '3.7'

services:
  example:
    entrypoint: [
      '/bin/sh',
      '-c',
      '[command]'
    ]
```

##

```yml
version: '3.7'

services:
  example:
    entrypoint:
      - /bin/sh
      - -c
      - [command]
```

##

```yml
version: '3.7'

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
version: '3.7'

services:
  example:
    entrypoint: >
      /bin/sh -c '[command]'
```

## Linebreaks

```yml
version: '3.7'

services:
  example:
    entrypoint: |
      /bin/sh \
        -c '[command]'
```
