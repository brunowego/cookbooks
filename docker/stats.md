# Docker Stats

**Keywords:** Container Metrics

## Articles

- [Setting Memory and CPU Limits In Docker](https://baeldung.com/ops/docker-memory-limit)

## Usage

```sh
#
docker stats
docker stats --no-stream
```

```yml
---
services:
  postgres:
    # ...
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 50M
          pids: 1
        reservations:
          cpus: '0.25'
          memory: 20M
      restart_policy:
        condition: on-failure
        delay: 5s
        max_attempts: 3
        window: 120s
```
