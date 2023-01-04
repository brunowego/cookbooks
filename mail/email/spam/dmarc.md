# Domain-based Message Authentication, Reporting, and Conformance (DMARC)

<!--
DMARC Version Tag
DMARC Policy Tag
Existing DMARC DNS Record
-->

## Links

- [Main Website](https://dmarc.io)

<!-- ##

https://login.ondmarc.com/signup -->

## Checking

```sh
#
export DOMAIN='<domain>'

#
dig _dmarc."$DOMAIN" txt +noall +answer +short
```
