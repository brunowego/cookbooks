# sigh

**Keywords:** Code Signing

## Links

- [Code Repository](https://github.com/fastlane/fastlane/tree/master/sigh)
- [Docs](https://docs.fastlane.tools/actions/sigh/)

## CLI

### Commands

```sh
bundle exec fastlane sigh -h
```

### Usage

```sh
#
bundle exec fastlane sigh manage

# Clean expired
bundle exec fastlane sigh manage -e

# Clean pattern
bundle exec fastlane sigh manage -p 'iOS\ ?Team Provisioning Profile:'

#
bundle exec fastlane sigh renew

#
bundle exec fastlane sigh download_all
```

<!--
bundle exec fastlane sigh --adhoc

bundle exec fastlane sigh --development

bundle exec fastlane sigh -a com.krausefx.app -u username

bundle exec fastlane action sigh

bundle exec fastlane sigh repair

bundle exec fastlane sigh resign

bundle exec fastlane sigh repair

bundle exec fastlane sigh resign ./path/app.ipa \
  --signing_identity "iPhone Distribution: Felix Krause" \
  -p "my.mobileprovision"
-->

### Configuration

```sh
cat << EOF > ./.gitignore
*.mobileprovision
EOF
```
