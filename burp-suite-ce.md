# Burp Suite Community Edition (CE)

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

### Tips

#### Dark Theme

1. Tab: User options
2. Sub-tab: Display
3. User Interface -> Theme: Select Dark

<!--
curl \
    -X 'POST' \
    --cookie ./c.txt \
    --cookie-jar ./c.txt \
    -H 'Content-Type: application/json' \
    --data-binary '{"email": "admin@snyk.io", "firstname": "admin", "lastname": "admin", "country": "IL", "phone": "+972551234123", "layout": "./../package.json"' 'http://localhost:3001/account_details'

curl \
    -X 'POST' \
    --cookie ./c.txt \
    --cookie-jar ./c.txt \
    -H 'Content-Type: application/json' \
    --data-binary '{"username": "admin@snyk.io", "password": "SuperSecretPassword"}' 'http:// localhost:3001/login'

-->
