# Step CI

**Keywords:** API Testing, QA

<!--
https://github.com/marketplace/actions/step-ci-action
-->

## Links

- [Code Repository](https://github.com/stepci/stepci)
- [Main Website](https://stepci.com)
- [Code Examples](https://github.com/stepci/stepci/tree/main/examples)

## Glossary

- Quality Assurance (QA)

## CLI

### Installation

#### Homebrew

```sh
brew install stepci
```

### Commands

```sh
stepci -h
```

<!--
```yml
---
version: '1.1'
name: Status Check
env:
  host: localhost
  port: 3000
  resource: _healthcheck
tests:
  example:
    steps:
      - name: GET request
        http:
          url: http://${{env.host}}:${{env.port}}/${{env.resource}}
          method: GET
          check:
            status: /^20/
```
-->
