# Domain-based Message Authentication, Reporting, and Conformance (DMARC)

<!--
DMARC Version Tag
DMARC Policy Tag
Existing DMARC DNS Record
-->

## Links

- [Main Website](https://dmarc.io)

## Tools

- [MxToolbox - DMARC Check Tool - Check DMARC Records for Errors](https://mxtoolbox.com/dmarc.aspx)

<!--
https://dmarcian.com/domain-checker
https://easydmarc.com/tools/dmarc-lookup
-->

<!-- ##

https://login.ondmarc.com/signup -->

## Checking

```sh
#
export DOMAIN='<domain>'

#
dig _dmarc."$DOMAIN" txt +noall +answer +short
```

<!--
v=DMARC1; p=quarantine; pct=50; rua=mailto:info@example.com; ruf=mailto:info@example.com; fo=1
-->
