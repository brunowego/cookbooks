# cert

**Keywords:** Code Signing

## Links

- [Code Repository](https://github.com/fastlane/fastlane/tree/master/cert)
- [Docs](https://docs.fastlane.tools/actions/cert/)

## CLI

### Commands

```sh
fastlane cert -h
```

### Usage

```sh
#
fastlane cert
fastlane cert -u <email>
```

### Configuration

```sh
cat << EOF > ./.gitignore
*.cer
EOF
```

<!--
*.certSigningRequest
*.p12
-->
