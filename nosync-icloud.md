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

#
cat << EOF | tee -a ~/.zshrc

# nosync-icloud
alias nosync='nosync -s'
EOF
```

### Usage

```sh
#
nosync
nosync -f ./node_modules
nosync -f ./vendor
nosync -f ./.venv
nosync -f ./.terraform
nosync -f ./bower_components
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

# For Bower
find . -type d -name 'bower_components' -prune

find . -type d -name 'bower_components' -prune | while read fname; do
  nosync -sf "$fname"
done
```

#### Visual Studio Code

```sh
jq '."search.exclude"."**/*.nosync" |= true' "$HOME/.config/Code/User/settings.json" | \
  sponge "$HOME/.config/Code/User/settings.json"
```

<!-- ####

```sh
find . -type d -name '*.nosync' -exec rm -fR {} \;
``` -->

#### Remove Symbolic Links

```sh
find . -type l -exec rm {} \;
```

### Issues

#### Disable Recommended Protections for NPM

```log
npm WARN reify Removing non-directory [/absolute/path/to/project]
```

```sh
echo 'force = true' >> ~/.npmrc
```

<!-- ####

```sh
find . -type d -name 'node_modules 2'
find . -type d -name 'vendor 2'
``` -->
