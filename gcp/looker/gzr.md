# Gazer (gzr)

<!--
https://github.com/nathanbowness/MSR2023_MiningProject/blob/fd8df7e8996a074474385da694d2b5cec1ecaef5/readmes/ruby/looker-open-source_gzr_readme.md?plain=1
-->

## Links

- [Code Repository](https://github.com/looker-open-source/gzr)

## CLI

### Installation

```sh
gem install gazer
```

### Commands

```sh
gzr help
```

<!--
chmod 600 ~/.netrc

machine <mycompany>.cloud.looker.com
  login <client-id>
  password <client-secret>
-->

### Usage

```sh
export LOOKER_HOST='<mycompany>.cloud.looker.com'

gzr user ls --host "$LOOKER_HOST"
gzr user me --host "$LOOKER_HOST"
```

### Issues

#### TBD

```log
ERROR: Invalid credentials
```

TODO
