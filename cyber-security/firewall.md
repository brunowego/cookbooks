# Firewall

## Links

- [Awesome WAF](https://github.com/0xInfection/Awesome-WAF)

## Glossary

- Network Address Translation (NAT)
- Web Application Firewall (WAF)
- Intrusion Detection Sensor (IDS)
- Intrusion Prevention Sensor (IPS)

## Tools

- iptables
- ModSecurity
- [Snort](/cyber-security/tools/snort.md)
- Suricata

<!--
FireHOL
OpenSnitch

https://github.com/pfsense/pfsense
https://github.com/safing/portmaster
-->

## IPS and IDS

![IPS and IDS in Network Security](/assets/images/cyber-security/ips-and-ids-in-network-security.png)

| Parameter                  | IPS                                                                                                                    | IDS                                                                      |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Abbreviation for           | Intrusion Prevention System                                                                                            | Intrusion Detection System                                               |
| System Type                | Active (monitor & automatically defend) and/ or passive                                                                | Passive (monitor and Notify)                                             |
| Detection mechanism        | Statistical anomaly based detection Signature detection: Exploit-facing signatures and Vulnerability-facing signatures | Signature detection: Exploit-facing signatures                           |
| Placement                  | Inline to data communication                                                                                           | Out of band from data communication                                      |
| Anomaly response           | Drop, alert or clean malicious traffic                                                                                 | Sends alarm/alert of detecting malicious traffic                         |
| Network performance impact | Slow down network performance due to delay caused by inline IPS processing                                             | Does not impact network performance due to non-line deployment of IDS    |
| Benefits                   | Preferred by most organization since detection and prevention are automatically performed                              | Does not block legitimate traffic which might be blocked by IPS at times |

<!--
https://ipwithease.com/difference-between-ips-and-ids-in-network-security/
-->
