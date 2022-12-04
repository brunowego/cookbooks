# fastlane Lanes

## Boilerplate

```rb
# frozen_string_literal: true

opt_out_usage
skip_docs

default_platform :ios

platform :ios do
  before_all do
    cocoapods
  end

  # ...
end
```

<!--
upload_to_testflight(
  changelog: 'external!',
  distribute_external: true,
  notify_external_testers: true,
  groups: [
    'External'
  ],
)
-->
