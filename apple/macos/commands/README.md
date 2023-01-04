# Apple Commands

## Tips

### Startup App

Open `System Preferences`, select `Users & Groups` and click on your name, select `Login Items` and select the apps what you wish launch at startup.

### New Terminal at Folder

Opening a new terminal in any folder is not enabled by default under Mac OS X. Here is a tip to enable this powerful feature:

1. Go to **System Preferences**
2. Click on the **Keyboard** icon
3. Click on the **Shortcuts** panel
4. Click on the **Services** entry
5. Enable the **New Terminal at Folder** checkbox

Now you can open a terminal in any folder from Finder.

### Find and remove .DS_Store files

```sh
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
```

### Prevent Accidents

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
