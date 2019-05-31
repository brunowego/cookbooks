# Commands

## Self update

```sh
phpbrew self-update
```

## Update

```sh
phpbrew update
```

## Know

```sh
phpbrew known
```

## Variants

```sh
phpbrew variants
```

## List

```sh
phpbrew list
```

## Install

```sh
phpbrew --debug install --stdout [version] as [version]-dev +default +mysql
```

## Use

```sh
phpbrew use [version]-dev
```

## Switch

```sh
phpbrew switch [version]-dev
```

## Extensions

```sh
phpbrew extension
```

### Options

```sh
phpbrew --debug ext --show-options --show-path
```

### Commands

```sh
phpbrew --debug ext install [extension]
phpbrew --debug ext show [extension]
phpbrew --debug ext enable [extension]
phpbrew --debug ext disable [extension]
phpbrew --debug ext clean --purge [extension]
```

## Like

```sh
phpbrew install [version] as [version]-dev like [version]-dev
```

## Clean

```sh
phpbrew clean [version]-dev
```

## Purge

```sh
phpbrew switch-off
phpbrew purge [version]-dev
```
