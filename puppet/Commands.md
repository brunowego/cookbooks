# Commands

## Agent

### Enable

```sh
puppet agent --enable
```

### Status

```sh
cat $(puppet config print vardir)/state/agent_disabled.lock
```

### Disable

```sh
puppet agent --disable
```
