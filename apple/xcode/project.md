# Xcode Project

<!--
https://www.youtube.com/watch?v=yuo50-TiKgo
-->

## Create

```sh
open /Applications/Xcode.app
```

1. Create a new Xcode project
2. Choose a template for your new project: -> iOS tab -> Application section -> Select App -> Next
   - Product Name: `MyApp`
   - Team: `Select`
   - Organization Identifier: `com.example`
   - Interface: `SwiftUI`
   - Language: `Swift`
   - Check "Include Tests"
   - Next

## Issues

### Missing Dependencies

```log
Unable to load contents of file list: '/Target Support Files/Pods-<Name>/Pods-<Name>-frameworks-Debug-output-files.xcfilelist'
```

```sh
bundle exec pod install
```
