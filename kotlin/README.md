# Kotlin

<!--
https://github.com/piomin/course-kubernetes-microservices

https://app.pluralsight.com/library/courses/kotlin-fundamentals/table-of-contents
https://app.pluralsight.com/library/courses/kotlin-junit5-unit-testing/table-of-contents
https://app.pluralsight.com/library/courses/android-unit-testing-junit-mockito-using-kotlin/table-of-contents

https://www.youtube.com/watch?v=5flXf8nuq60
https://www.youtube.com/watch?v=BBWyXo-3JGQ
https://app.pluralsight.com/search/?q=kotlin&type=video-course&source=user_typed

https://github.com/Creditas/kotlin-ddd-sample
https://github.com/VMadalin/kotlin-sample-app
https://github.com/material-components/material-components-android-examples
-->

## CLI

### Installation

#### Homebrew

```sh
brew install kotlin
```

### Commands

```sh
kotlin -h
```

<!-- ### Usage

```sh
#
kotlin
``` -->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension fwcd.kotlin

#
jq '."recommendations" += ["fwcd.kotlin"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.kt]
indent_size = 4
EOF
```
