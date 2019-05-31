# Tips

## Caches

### Downloads

```sh
open ~/Library/Caches/Homebrew/downloads
```

## How to install older versions

```sh
brew info memcached
```

```sh
cd "$(brew --repo homebrew/core)"
```

```sh
git log master -- Formula/memcached.rb
```

```sh
cd "$(brew --repo homebrew/core)" && git checkout 5ec463decefeaab3d1825b923ad2dbee73ffc6dc
```

```sh
HOMEBREW_NO_AUTO_UPDATE=1 \
  brew install memcached
```

```sh
git checkout master
```
