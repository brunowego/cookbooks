# Tinybird

**Keywords:** Serverless ClickHouse

## Links

- [Main Website](https://tinybird.co)
- [Dashboard](https://ui.tinybird.co)
  - [Tokens](https://ui.tinybird.co/tokens)

<!--
https://github.com/unkeyed/unkey/tree/main/packages/tinybird
-->

## Terms

- Log Analytics
- Web Analytics

## CLI

### Links

- [Docs](https://tinybird.co/docs/cli.html)

### Installation

```sh
pip3 install -U tinybird-cli
```

### Commands

```sh
tb -h
```

### Configuration

```sh
#
tb auth

#
echo '/.tinyb' >> ./.gitignore
```

<!--
TINYBIRD_API_URL=https://api.tinybird.co
TINYBIRD_API_KEY=
-->

### Usage

```sh
#
tb workspace ls
tb workspace use <name>
tb workspace current
tb workspace members ls

#
tb workspace clear
tb workspace delete

# Perhaps need cwd to ./packages/tinybird
tb push

#
tb datasource ls


#
tb fmt ./<filename> --yes # .pipe, .incl, .datasource
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension TinybirdCo.vscode-tinybird-support

#
jq '."recommendations" += ["TinybirdCo.vscode-tinybird-support"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### ISSUES

#### TBD

```log
** Failed pushing pipe top_links: [Error] Storage ReplicatedMergeTree doesn't support FINAL: While processing link_id IN ((SELECT link_id FROM Acme.dub_links_metadata_latest AS dub_links_metadata_latest FINAL WHERE (project_id = 'cl7wsy2836920mjrb352g5wfx') AND (deleted = 0)) AS _subquery46861060). (ILLEGAL_FINAL)
```

TODO
