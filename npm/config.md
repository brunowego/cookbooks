# NPM Config

## Usage

```sh
# List
npm config list

# Save Prefix
npm config set save-prefix '~' -L project
npm config get save-prefix

# Registry
npm config set registry 'https://registry.xyz.tld/' -L project
npm config get registry

# License
npm config set init-license 'MIT' -L project
npm config set init-license 'UNLICENSED' -L project
npm config set init-license 'COPYRIGHT' -L project

#
npm config set update-notifier false
```
