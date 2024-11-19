# List

## Usage

```sh
#
export NPM_PACKAGE_NAME='<package-name>'

#
npm list "$NPM_PACKAGE_NAME" --depth=0 | grep "$NPM_PACKAGE_NAME" | awk -F '@' '{print $2}'
```
