# Commands

## Remote

```sh
jabba ls-remote
```

## Install

```sh
jabba install [version]
```

## List

```sh
jabba ls [version]
```

## Use

```sh
jabba use [version]
```

## Current

```sh
jabba current
```

## Alias

```sh
jabba alias default [version]
```

## Link

### OS X

```sh
/usr/libexec/java_home -V
```

```sh
export JAVA_VERSION="`/usr/libexec/PlistBuddy -c 'Print :JavaVM:JVMVersion' $(dirname $(/usr/libexec/java_home))/Info.plist`"
```

```sh
jabba link system@$JAVA_VERSION $(dirname $(dirname $(/usr/libexec/java_home)))
```

## Uninstall

```sh
jabba uninstall [version]
```
