# PortSwigger Burp Suite Community Edition (CE)

<!--
Released 2003-06
-->

<!--
https://app.pluralsight.com/library/courses/web-application-penetration-testing-with-burp-suite/table-of-contents
https://app.pluralsight.com/library/courses/advanced-web-application-penetration-testing-burp-suite/table-of-contents
https://app.pluralsight.com/paths/skill/web-security-testing-with-burp-suite
https://app.pluralsight.com/library/courses/writing-burp-suite-macros-plugins/table-of-contents
-->

**Keywords:** DAST, Web Proxy, Traffic Analysis, Man-In-The-Middle

## Links

- [Org. Repository](https://github.com/PortSwigger)
- [Main Website](https://portswigger.net/burp/)

## App

### Installation

#### Homebrew

```sh
brew install burp-suite
```

### Certificate

**Dependencies:** [iproute2](/iproute2.md)

```sh
# Darwin
export PROXY_HOST="http://$(ip route get 1 | awk '{print $NF;exit}'):8080"
# or, Windows/Linux
# TODO

#
curl \
  -ks \
  -o ./burp.der \
  -x "$PROXY_HOST" \
  http://burp/cert

# Darwin
sudo security add-trusted-cert -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain \
  ./burp.der

# or, Windows/Linux
# TODO
```

### Testing

- [Snyk's Vulnerable Demo Application](/snyk/demo/README.md)

### Tips

#### Dark Theme

1. Open Burp Suite CE -> Settings
2. User Interface -> Display
3. Appearance section -> Theme: Select Dark

#### Export CA certificate

1. Open Burp Suite CE -> Proxy -> Proxy settings tab
2. Tools / Proxy -> Proxy Listeners section -> Import / export CA certificate
3. CA Certificate -> Export: Select Certificate in DER format -> Next
   - Choose a location to save the certificate: `~/Downloads/burp.der` -> Save
   - Next -> Close

<!--
curl \
  -s http://burp/cert \
  -x http://127.0.0.1:8080 \
  -o ./burp.der
-->

#### Install Android CA Certificate

**Dependencies:** [Root access](/android/sdk/platform-tools.md#root-access)

```sh
#
openssl x509 -inform DER -in ./burp.der -out ./burp.pem

#
export CERT_HASH="$(openssl x509 -inform PEM -subject_hash_old -in ./burp.pem | head -1)"

#
mv ./burp.pem "${CERT_HASH}.0"

# Need root
adb shell whoami | grep root

#
adb push "${CERT_HASH}.0" /system/etc/security/cacerts

# Check if permissions is the same of others
adb shell ls -la /system/etc/security/cacerts | grep "${CERT_HASH}.0"
```

<!--
adb kill-server
-->

#### Install iOS CA Certificate

TODO

### Issues

#### Production Build

```log
adbd cannot run as root in production builds
```

Will not work on production builds (`google_apis_playstore`).

#### Multiple Devices

```log
adb: unable to connect for root: more than one device/emulator
```

```sh
#
adb devices -l

#
adb disconnect
```
