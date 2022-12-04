# Action Fastlane

<!--
https://github.com/givtnl/Givt.App.Flutter/blob/pre-main/.github/workflows/ios.yml
https://github.com/daniele-athome/airborne/blob/master/.github/workflows/ios.yml
https://github.com/MirrikhSoftware/Yasin-flutter/blob/main/.github/workflows/flutter_ci_cd.yml
https://github.com/AnthonyAniobi/Solar_Consult-mobile/blob/main/.github/workflows/release.yml
-->

<!--
KNOWN_HOSTS
ssh-keyscan github.com | pbcopy -

https://docs.fastlane.tools/actions/setup_ci/

if is_ci
    puts "Running on CI!"

    setup_ci(
        force: true
    )
end
-->

<!--
```yml
---
name: iOS Deploy

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: macOS-latest

    steps:
      - uses: actions/checkout@v2

      - name: Set up Ruby
        uses: actions/setup-ruby@v1
        with:
          ruby-version: 2.7

      - name: Install SSH key
        uses: shimataro/ssh-key-action@v2
        with:
          key: ${{ secrets.SSH_KEY }}
          known_hosts: ${{ secrets.KNOWN_HOSTS }}

      - name: Set up Fastlane
        run: bundle install

      - name: Build & Deploy to Firebase
        run: bundle exec fastlane firebase
        env:
          FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
          FIREBASE_APP_ID: ${{ secrets.FIREBASE_APP_ID }}
          FIREBASE_TESTERS: ${{ secrets.FIREBASE_TESTERS }}
          FIREBASE_TEST_GROUP: ${{ secrets.FIREBASE_TEST_GROUP }}
```
-->

TODO
