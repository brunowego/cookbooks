# match

<!--
https://www.wafrat.com/fixing-ios-distribution-certificate-related-errors/
https://tabris.com/ios-provisioning-profiles-management-with-fastlane-match/
-->

**Keywords:** Code Signing for iOS

Encapsulate [cert](./cert.md) and [sigh](./sigh.md).

## Links

- [Code Repository](https://github.com/fastlane/fastlane/tree/master/match)
- [Docs](https://docs.fastlane.tools/actions/match/)

## Docs

- [Manually manage the fastlane match Repo](https://docs.fastlane.tools/advanced/other/#manually-manage-the-fastlane-match-repo)

## Related

- [Code Signing Guide for Teams](https://codesigning.guide/)

## Recommendations

- Remove unused [Certificates](https://developer.apple.com/account/resources/certificates/list)
- Remove unused [Devices](https://developer.apple.com/account/resources/devices/list)
- Remove unused [Profiles](https://developer.apple.com/account/resources/profiles/list)

## CLI

### Dependencies

**Repository:**

Create git repository called `fastlane-cert-match-store` on your [Git Service](/git/git-service.md).

1. Open `open *.xcworkspace`
2. Project navigator -> Select project
3. Signing & Capabilities tab
   - All sub-tab -> Uncheck "Automatically manage signing"
   - Debug sub-tab -> iOS section -> Provisioning Profile -> Select "match Development <com.example.app>"
   - Release sub-tab -> iOS section -> Provisioning Profile -> Select "match AppStore <com.example.app>"

### Commands

```sh
bundle exec fastlane match -h
```

### Initialize

```sh
bundle exec fastlane match init
```

### Usage

```sh
#
bundle exec fastlane match development # adhoc, appstore (distribution), enterprise

#
bundle exec fastlane match nuke development # distribution (appstore), enterprise
```

### Verify

1. Open Keychain Access
2. Default Keychains -> My Certificates

<!--
lane :create_keys do
  match type: 'development'
  match type: 'adhoc'
  match type: 'appstore'
end
-->
