# Tips

## Shebang (Unix)

```sh
#! /bin/sh
```

## Turn `.bashrc` auto-load automatically

```sh
sudo vim ~/.profile
```

```sh
tee -a ~/.profile << EOF
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
EOF
```

## Restore

```sh
rm -rf ~/.bashrc
```

```sh
sudo cp /root/.bashrc ~
```

## Reload

```sh
source ~/.bashrc
. ~/.bashrc
```
