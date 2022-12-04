# build

## Boilerplate

```rb
# ...

default_platform :ios

platform :ios do
  # ...

  desc 'Build'
  lane :build do
    match type: 'adhoc', readonly: true # adhoc

    build_app(
      workspace: "#{ENV['FASTLANE_APP_NAME']}.xcworkspace",
      scheme: ENV['FASTLANE_APP_SCHEME'],
      # export_options: {
      #   method: 'app-store', # 'ad-hoc'
      #   provisioningProfiles: {
      #     ENV['FASTLANE_APP_IDENTIFIER'] => ENV['FASTLANE_PROVISIONING_PROFILE']
      #   }
      # },
      # clean: true
    )
  end

  # ...
end
```

```sh
#
bundle exec fastlane ios build
# or
bundle exec fastlane build
```
