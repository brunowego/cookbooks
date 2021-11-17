# nosync-icloud

## Links

- [Code Repository](https://github.com/haochuan9421/nosync-icloud)

## CLI

### Installation

#### NPM

```sh
npm i -g nosync-icloud
```

### Commands

```sh
nosync -h
```

### Configuration

```sh
# Git ignore
echo '/**/*.nosync' >> ~/.gitignore_global
```

### Usage

```sh
#
nosync
nosync -f ./node_modules
nosync -f ./vendor
nosync -f ./.venv
nosync -f ./.terraform
```

### Tips

#### Batch NoSync

```sh
# For NPM (Node.js)
find . -type d -name 'node_modules' -prune | grep -v 'node_modules.nosync'

find . -type d -name 'node_modules' -prune | grep -v 'node_modules.nosync' | while read fname; do
  nosync -sf "$fname"
done

# For Composer (PHP)
find . -type d -name 'vendor' -exec test -d '{}/bin' \; -print

find . -type d -name 'vendor' -exec test -d '{}/bin' \; -print | while read fname; do
  nosync -sf "$fname"
done

# For Virtualenv (Python)
find . -type d -name '.venv' -prune

find . -type d -name '.venv' -prune | while read fname; do
  nosync -sf "$fname"
done

# For Terraform
find . -type d -name '.terraform' -exec test -f '{}/terraform.tfstate' \; -print

find . -type d -name '.terraform' -exec test -f '{}/terraform.tfstate' \; -print | while read fname; do
  nosync -sf "$fname"
done
```

#### Visual Studio Code

```sh
# For NPM (Node.js)
jq '."search.exclude"."**/node_modules.nosync" |= true' "$HOME/.config/Code/User/settings.json" | \
  sponge "$HOME/.config/Code/User/settings.json"

# For Composer (PHP)
jq '."search.exclude"."**/vendor.nosync" |= true' "$HOME/.config/Code/User/settings.json" | \
  sponge "$HOME/.config/Code/User/settings.json"
```
