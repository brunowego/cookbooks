# Typescript

## Issues

### Heap out of memory

```log
FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory
```

```yml
# ...

jobs:
  lint:
    # ...

    steps:
      # ...

      - env:
          NODE_OPTIONS: --max_old_space_size=4096
        # ...
```
