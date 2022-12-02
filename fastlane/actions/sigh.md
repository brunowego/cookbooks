# sigh

**Keywords:** Code Signing

## Links

- [Code Repository](https://github.com/fastlane/fastlane/tree/master/sigh)
- [Docs](https://docs.fastlane.tools/actions/sigh/)

## CLI

### Commands

```sh
fastlane sigh -h
```

### Usage

```sh
#
fastlane sigh manage

# Clean expired
fastlane sigh manage -e

# Clean pattern
fastlane sigh manage -p 'iOS\ ?Team Provisioning Profile:'

#
fastlane sigh renew

#
fastlane sigh download_all
```

<!--
fastlane sigh --adhoc

fastlane sigh --development

fastlane sigh -a com.krausefx.app -u username

fastlane action sigh

fastlane sigh repair

fastlane sigh resign

fastlane sigh repair

fastlane sigh resign ./path/app.ipa \
  --signing_identity "iPhone Distribution: Felix Krause" \
  -p "my.mobileprovision"
-->

### Configuration

```sh
cat << EOF > ./.gitignore
*.mobileprovision
EOF
```
