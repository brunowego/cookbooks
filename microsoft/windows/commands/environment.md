# Environment

## Usage

```sh
# Home path
setx /m HOME %USERPROFILE%

#
Change users folder
HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS NT\CurrentVersion\ProfileList
```

## Tips

### Set Proxy

```sh
# Set
set HTTP_PROXY=[username]:[password]@[hostname]:[port]
set HTTPS_PROXY=[username]:[password]@[hostname]:[port]

# Remove
set HTTP_PROXY=
set HTTPS_PROXY=
```
