# Fastlane with Android

## Lanes

TODO

## Boilerplate

**Refer:** `./.fastlane/Fastfile`

```rb
# frozen_string_literal: true

opt_out_usage
skip_docs

default_platform :android

platform :android do
  # before_all do
  #   # TODO
  # end

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
