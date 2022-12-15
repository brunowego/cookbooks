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

```sh
# Darwin
export PROXY_HOST="http://$(ip route get 1 | awk '{print $NF;exit}'):8080"
# or, Windows/Linux
# TODO

#
curl \
  -ks \
  -o /tmp/burp.der \
  -x "$PROXY_HOST" \
  http://burp/cert

# Darwin
sudo security add-trusted-cert -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain \
  /tmp/burp.der
# or, Windows/Linux
# TODO
```

### Testing

- [Snyk's Vulnerable Demo Application](/snyk/demo/README.md)

### Tips

#### Dark Theme

1. Burp -> Settings
2. User Interface -> Display
3. Appearance section -> Theme: Select Dark

<!--
https://github.com/johto89/Some-command-for-security/tree/master
https://github.com/merlinepedra/MEDUSA-PY/blob/master/utils/installBurpCert.sh

curl -s http://burp/cert -x http://127.0.0.1:8080 -o cacert.der
openssl x509 -inform DER -in cacert.der -out cacert.pem
export CERT_HASH=$(openssl x509 -inform PEM -subject_hash_old -in cacert.pem | head -1)
adb root && adb remount
adb push cacert.pem "/sdcard/${CERT_HASH}.0"
adb shell su -c "mv /sdcard/${CERT_HASH}.0 /system/etc/security/cacerts"
adb shell su -c "chmod 644 /system/etc/security/cacerts/${CERT_HASH}.0"
rm -rf cacert.*
-->
