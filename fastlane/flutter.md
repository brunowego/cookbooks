# Fastlane with Flutter

## Lanes

TODO

## Boilerplate

**Refer:** `./.fastlane/Fastfile`

```rb
# frozen_string_literal: true

opt_out_usage
skip_docs

before_all do |lane, options|
  if is_ci
    setup_ci
  end
end

import './lanes/android'
import './lanes/ios'
```
