# Open Policy Agent (OPA)

<!--
https://github.com/infra-as-code-workshop/opa

https://www.youtube.com/watch?v=AfTuzonH93U
https://www.youtube.com/watch?v=ijQdHy4XQCU
https://www.youtube.com/watch?v=Vdy26oA3py8
https://www.youtube.com/watch?v=RDWndems-sk
https://www.youtube.com/watch?v=Uj2N9S58GLU
https://www.youtube.com/watch?v=ijQdHy4XQCU
https://www.youtube.com/watch?v=14lGc7xMAe4
https://www.youtube.com/watch?v=ggMyp3TEc34
https://www.youtube.com/watch?v=Lca5u_ODS5s
https://www.youtube.com/watch?v=OjAOzgwRVlU
https://www.youtube.com/watch?v=xMm0w_ws2SQ
https://www.youtube.com/watch?v=u1KUft3fsCk

https://thenewstack.io/getting-open-policy-agent-up-and-running/

https://github.com/onelittlenightmusic/opa-up-and-running/blob/bb36c25042375612e04bffb896781e0fe6c9b374/README.md

https://github.com/onelittlenightmusic/zenn-articles/blob/356877d986f8324d19e603608ffe2b9fb90c698b/articles/e9f50f7d6e40cc0f0830.md

https://github.com/pbnj/pbnj.github.io/blob/6b68214fb58f1ec46e91a4d611e7e3b928acf563/blog/unit-test-your-configuration-files.md
-->

## Links

- [Code Repository](https://github.com/open-policy-agent/opa)
- [Main Website](https://openpolicyagent.org/)
- [The Rego Playground](https://play.openpolicyagent.org/)

## Guides

- [Policy Language](https://openpolicyagent.org/docs/latest/policy-language/)
- [Kafka](https://openpolicyagent.org/docs/latest/kafka-authorization/)

##

- Policy-as-Code

## CLI

### Installation

#### Homebrew

```sh
brew install opa
```

### Commands

```sh
opa -h
```

### Usage

```sh
#
opa run \
  -s \
  ./example.rego

#
echo -e '[INFO]\thttp://127.0.0.1:8181'

#
opa test .
opa test --format=json -v .
```

<!--
curl localhost:8181/v1/data/play -i -d @input.json -H 'Content-Type: application/json'

curl localhost:8181/v1/data/play/hello -i -d @input.json -H 'Content-Type: application/json'

curl localhost:8181/v1/data/play/newdata -i -d @input.json -H 'Content-Type: application/json'

curl localhost:8181/v1/data/play/importdata -i -d @input.json -H 'Content-Type: application/json'
-->

<!--
opa eval \
  -i ./input.json \
  -d ./data.json \
  -d ./example.rego \
  "data.example_rbac"
-->

### Tips

<!-- ####

```sh
curl -X PUT http://localhost:8181/v1/data/myapi/acl --data-binary @scripts/arun-acl.json #Add data
curl -X PUT http://localhost:8181/v1/policies/myapi --data-binary @scripts/arun.rego #Add policy
``` -->

#### Visual Studio Code

```sh
#
code --install-extension tsandall.opa

#
code --install-extension plex.vscode-regolint
```
