# tsh

## Docs

- [Using the tsh Command Line Tool](https://goteleport.com/docs/connect-your-client/tsh/)

## Commands

```sh
tsh help
```

## Usage

```sh
#
tsh status

#
tsh ls

#
tsh clusters

#
tsh request ls

#
tsh request show '<request-id>'
tsh request search --kind node
tsh request search --kind db

#
tsh login --request-id '<request-id>'
```

<!--
tsh request search \
  --kind node \
  --search iot

tsh request create \
  --resources '[{"cluster":"cluster-one","kind":"node","name":"d774a757-d0cc-4259-8022-61c8d63450fa"}]' \
  --reason <request reason>

tsh request review \
  --deny \
  --reason='you seem sus' \
  094fc0f3-e5ab-47c5-816e-09326735a899

tsh scp some-file.ext server.domain.tld:
-->

<!-- ## Tips

### Session Sharing

```sh
#
tsh join <uuid>
``` -->
