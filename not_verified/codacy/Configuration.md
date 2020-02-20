# Configuration

```sh
touch .codacy.yaml || exit
```

```yml
---
engines:
  duplication:
    enabled: true
    exclude_paths:
      - config/engines.yaml
  metrics:
    enabled: true
    exclude_paths:
      - config/engines.yaml
  coverage:
    enabled: true
    exclude_paths:
      - config/engines.yaml
languages:
  css:
    extensions:
      - '-css.resource'
exclude_paths:
  - assets/**
  - Vagrantfile
  - Dockerfile
```
