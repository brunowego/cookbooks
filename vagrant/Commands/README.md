# Commands

## Init

```sh
vagrant init [name]
```

## Up

```sh
vagrant up
```

### Specify

```sh
vagrant up --provider virtualbox
```

## Reload

```sh
vagrant reload
```

### Re-provision

```sh
vagrant reload --provision
```

## Provision

```sh
vagrant provision
```

## Status

```sh
vagrant status
```

### Global

```sh
vagrant global-status
```

#### Prune

```sh
vagrant global-status --prune
```

## SSH

```sh
vagrant ssh
```

### Execute command

```sh
vagrant ssh -c '[path/to/exec]'
```

## Stop

```sh
vagrant halt
```

## Suspend

```sh
vagrant suspend
```

## Destroy

```sh
vagrant destroy -f
```
