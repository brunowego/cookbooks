# Algolia

<!--
algolia:sync
-->

## Links

- [Dashboard](https://dashboard.algolia.com)
- [Main Website](https://algolia.com)

<!--
https://www.algolia.com/doc/libraries/javascript/v5/
-->

<!--
https://github.com/viclafouch/memes-by-lafouch/blob/main/src/utils/algolia.ts
-->

<!--
https://github.com/neet/kampisos

https://github.com/zhouhua/blog/blob/main/src/lib/algolia.ts

https://github.com/Chaffexd/tam-hub/blob/main/lib/algolia.ts
https://github.com/warpdotdev/commands.dev/blob/main/lib/build-search.ts
https://github.com/Bartek532/zagrodzki.me/blob/main/scripts/algolia.ts
-->

## CLI

### Installation

```sh
# Using Homebrew
brew install algolia/algolia-cli/algolia
```

### Commands

```sh
algolia -h
```

### Configuration

```sh
#
algolia auth login
```

<!--
algolia profile list

algolia settings get dev_messages --output json | jq '.attributesForFaceting'

algolia settings get dev_messages --output json > ~/algolia-backups/dev_messages-$(date +%Y%m%d-%H%M%S).json
cat ~/algolia-backups/dev_messages-*.json | jq '.attributesForFaceting'

algolia settings import dev_messages --file ~/algolia-backups/dev_messages-<timestamp>.json

algolia synonyms export dev_messages --output synonyms-backup-$(date +%Y%m%d).ndjson
algolia objects export dev_messages --output ~/algolia-backups/dev_messages-records-$(date +%Y%m%d-%H%M%S).ndjson
-->
