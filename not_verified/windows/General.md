# General

## Show platform architecture

```sh
wmic os get osarchitecture
```

## File

Show file info.

```sh
file -L filename.exe
```

## Make link

Creates a directory symbolic link.

```sh
mklink /D link target
```

Creates a hard link instead of a symbolic link.

```sh
mklink /H link target
```

Creates a Directory Junction.

```sh
mklink /J link target
```
