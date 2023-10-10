# Git Hooks

<!--
https://github.com/sentenz/guide/blob/main/githooks/README.md
-->

## Links

- [Git Hooks](https://githooks.com)

## Docs

- [Customizing Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)

## Tools

- [Husky](/husky.md)
- [Lefthook](/lefthook.md)
- [pre-commit](/pre-commit.md)

## Build-in Solution

```sh
#
mkdir ./.githooks

#
cat << EOF > ./.githooks/pre-commit
#! /bin/bash

set -eo pipefail

echo '[pre-commit] Doing something...'

# ...
EOF

#
git config --local core.hooksPath ./.githooks
```

<!--
pre-commit
commit-msg
pre-push
post-checkout
-->

<!--
"postinstall": "git config core.hooksPath ./.githooks",
"prepare": "[ -z $CI ] && git config core.hooksPath ./.githooks || true",
-->
