# Prevent Accidents

## Safe RM

```sh
vim ~/.zshrc

# Safe RM
function rm () {
  local path

  for path in "$@"; do
    # Ignore any arguments.
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}

      # Append the time if necessary.
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%Y-%m-%d)
      done

      /bin/mv "$path" ~/.Trash/"$dst"
    fi
  done
}
```
