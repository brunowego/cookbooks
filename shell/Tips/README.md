# Commands

## Set

### Help

```sh
sh -c 'help set'
```

##

```sh
[command] || {
  [command]
}
```

## Ignore error

```sh
[command] || true
```

### Debug

```sh
set -xv
```

###

```sh
set -euxo pipefail
```

## Shebang (Unix)

```sh
#! /bin/sh
```

## Backtick

```sh
exec `which $SHELL`
```

##

```sh
exec $SHELL -l
```

## Shell name

```sh
echo $0
echo $SHELL
```

## Show current PID

```sh
echo $$
```

## Reload shell

```sh
sudo su - $USER
```

## Sub-shell

```sh
( cd dir && [command] )
( cd dir; [command] )
```

## Last argument

```sh
echo $_
```

## Stdout

```sh
|-
```

##

```sh
for dir in $(ls -1 .); do echo "$dir"; done
```

## If Statement

```sh
if [ condition ]; then command; fi
```

```sh
if [ condition ]; then
  command
fi
```

## Replacement Rules

| | `$variable=hello` | `$variable` is unset |
| --- | --- | --- |
| `$variable` | hello | "" |
| `${variable}` | hello | "" |
| `${variable:+default}` | hello | default |
| `${variable:-default}` | default | "" |
