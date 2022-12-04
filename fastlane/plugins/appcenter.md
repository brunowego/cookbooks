# App Center Plugin

<!--
https://www.udemy.com/course/ios-fastlane/learn/lecture/27429032#overview
-->

## CLI

### Links

- [Code Repository](https://github.com/microsoft/fastlane-plugin-appcenter)

### Installation

```sh
bundle exec fastlane add_plugin appcenter
```

<!--
APP_CENTER_API_TOKEN    = ""
APP_CENTER_OWNER_NAME   = ""
APP_CENTER_OWNER_TYPE   = "organization"
APP_CENTER_APP_NAME     = ""
APP_CENTER_DESTINATIONS = "Collaborators"
-->

<!--
desc "TODO"
lane :app_center do

  buildAdHoc

  appcenter_upload(
    api_token: ENV["APP_CENTER_API_TOKEN"],
    owner_name: ENV["APP_CENTER_OWNER_NAME"],
    owner_type: ENV["APP_CENTER_OWNER_TYPE"],
    app_name: ENV["APP_CENTER_APP_NAME"],
    notify_testers: true,
    destinations: ENV["APP_CENTER_DESTINATIONS"],
    release_notes: "appcenter!",
    file: lane_context[SharedValues::IPA_OUTPUT_PATH]
  )
end
-->
