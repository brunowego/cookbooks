# Docker Stack

## References

- [Deploy](https://docs.docker.com/compose/compose-file/#deploy)

## CLI

### Usage

```sh
# Deploy Compose
docker stack deploy --compose-file [name].yaml [name]

# Deploy Bundle
docker stack deploy --bundle-file [name].dab [name]

# List
docker stack ls

# Process
docker stack ps [name]

# Remove
docker stack rm [name]

# Services
docker stack services [name]
```
