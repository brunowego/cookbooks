# cert

**Keywords:** Code Signing

## Links

- [Code Repository](https://github.com/fastlane/fastlane/tree/master/cert)
- [Docs](https://docs.fastlane.tools/actions/cert/)

## CLI

### Commands

```sh
bundle exec fastlane cert -h
```

### Usage

```sh
#
bundle exec fastlane cert
bundle exec fastlane cert -u <email>
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
