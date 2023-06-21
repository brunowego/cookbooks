# Notation

<!--
OPA Gatekeeper
-->

**Keywords:** TUF

## Glossary

- Open Container Initiative (OCI)

## Links

- [Code Repository](https://github.com/notaryproject/notation)
- [Main Website](https://notaryproject.dev)

## CLI

### Usage

```sh
#
notation cert generate-test --default 'registry.root'

#
notation sign <image>
notation sign --signature-format cose <image>

#
notation ls <image>

#
notation verify <image>

#
cat << EOF > ./trustpolicy.json

EOF
```
