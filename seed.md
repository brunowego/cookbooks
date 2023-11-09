# Seed

## Tips

### Docker Entrypoint

**Refer:** `./docker-entrypoint.sh`

```sh
#! /bin/bash

if [[ ! -f ./.seeded ]]; then
    echo 'Seeding container...'

    # Do something here

    touch ./.seeded

    echo 'Done.'
fi

exec "$@"
```
