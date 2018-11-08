# Commands

## Show

```sh
pip show [package]
```

### Installed

```sh
pip freeze
```

## Install

```sh
pip install [package]
```

### With Extras

```sh
pip install .[[extras]]
```

### Without binaries

```sh
pip install --no-binary :all: [package]
```

### Without cache

```sh
pip install --no-cache-dir [package]
```

### Requirements

```sh
pip install -r requirements.txt
```

### Only for Current User

```sh
pip install --user -r requirements.txt
```

## Uninstall

```sh
pip uninstall -y [package]
```

## Upgrade

```sh
pip install --upgrade pip
```

> Perhaps need try with sudo.
