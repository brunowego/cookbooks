# Open Policy Agent (OPA)

<!--
https://opal.ac
-->

**Keywords:** Policy Management, PaC, AuthZ

![OPA Demo Overview](/assets/images/open-policy-agent/opa-demo-overview.png)

## Links

- [Code Repository](https://github.com/open-policy-agent/opa)
- [Main Website](https://openpolicyagent.org)
- [The Rego Playground](https://play.openpolicyagent.org)
- [Docs](https://openpolicyagent.org/docs)
  - [REST API](https://openpolicyagent.org/docs/latest/rest-api/)

## Guides

- [Policy Language](https://openpolicyagent.org/docs/latest/policy-language/)
- [Kafka](https://openpolicyagent.org/docs/latest/kafka-authorization/)
- [Authorization in microservices with Open Policy Agent, NodeJs, and ReactJs - Backend](https://pongzt.com/post/opa-nodejs/)

## Glossary

- General-purpose Policy Engine (GPE)
- Policy-as-Code (PaC)
- Unified Policy Enforcement (UPE)

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
