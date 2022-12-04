# Firebase App Distribution (firebase_app_distribution) Plugin

<!--
https://www.udemy.com/course/ios-fastlane/learn/lecture/27346076#overview
https://www.udemy.com/course/ios-fastlane/learn/lecture/27429400#overview
-->

## Links

- [Code Repository](https://github.com/fastlane/fastlane-plugin-firebase_app_distribution)

## Docs

- [Distribute Android apps to testers using fastlane](https://firebase.google.com/docs/app-distribution/android/distribute-fastlane)

### Installation

```sh
bundle exec fastlane add_plugin firebase_app_distribution
```

<!--
FIREBASE_DIST_SERVICE_ACCOUNT_FILE = ""
FIREBASE_APP_ID     = ""
FIREBASE_TEST_GROUP = ""
FIREBASE_TESTERS    = ""
-->

<!--
desc "TODO"
lane :firebase do

  buildAdHoc

  firebase_app_distribution(
    app: ENV["FIREBASE_APP_ID"],
    testers: ENV["FIREBASE_TESTERS"],
    groups: ENV["FIREBASE_TEST_GROUP"],
    ipa_path: lane_context[SharedValues::IPA_OUTPUT_PATH],
    release_notes_file: "fastlane/release_notes.txt",
    service_credentials_file: ENV["FIREBASE_DIST_SERVICE_ACCOUNT_FILE"]
  )
end
-->
