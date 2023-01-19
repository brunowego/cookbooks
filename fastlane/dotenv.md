# fastlane dotENV

<!--
Apple ID -> fastlane@domain.tld

https://github.com/matijagrcic/react-native/blob/main/Fastlane.md
-->

## Dependencies

- [dotenv](/ruby/ruby-dotenv.md#bundler)

## Configuration

**Refer:** `./.fastlane/.env` (or: `.env.staging`, `.env.production`)

```ini
GYM_PROJECT=Example.xcodeproj
GYM_SCHEME=development
```

**Refer:** `./.fastlane/.env.secret`

```ini
FASTLANE_PASSWORD=
```

**Refer:** `./.fastlane/Fastfile`

```ruby
# frozen_string_literal: true

fastlane_require 'dotenv'

Dotenv.load '.env.secret'

# ...
```

## Usage

```sh
#
bundle exec fastlane <lane> --env development # staging, production
```
