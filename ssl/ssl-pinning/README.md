# SSL/TLS Certificate Pinning (for short SSL Pinning)

<!--
http://labs.siteblindado.com/2020/02/bypass-ssl-pinning.html

https://medium.com/@anuj.rai2489/ssl-pinning-254fa8ca2109

iXGuard / RASP
-->

<!--
https://github.com/Eltion/Tiktok-SSL-Pinning-Bypass
https://github.com/Eltion/Instagram-SSL-Pinning-Bypass
https://github.com/Eltion/Facebook-SSL-Pinning-Bypass
-->

<!--
https://security.stackexchange.com/questions/169913/ios-android-certificate-pinning-with-lets-encrypt
-->

**Keywords:** Penetration Test (a.k.a. Pentest)

## Docs

- [Certificate and Public Key Pinning](https://owasp.org/www-community/controls/Certificate_and_Public_Key_Pinning)
- [OWASP Cheat Sheet Series / Pinning Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Pinning_Cheat_Sheet.html)
- [Preventing Man-in-the-Middle Attacks in iOS with SSL Pinning](https://kodeco.com/1484288-preventing-man-in-the-middle-attacks-in-ios-with-ssl-pinning) 🌟
- [What is certificate pinning?](https://digicert.com/blog/certificate-pinning-what-is-certificate-pinning)

## Discussion

- [How to use SSL from Let’s Encrypt for ssl pinning in mobile app?](https://community.letsencrypt.org/t/how-to-use-ssl-from-lets-encrypt-for-ssl-pinning-in-mobile-app/135720/14)

## Glossary

- Certificate Signing Request (CSR)
- Certification Authority Authorization (CAA)
- DNS-based Authentication of Named Entities (DANE)
- Domain Name System Security (DNSSEC)
- HTTP Public Key Pinning (HPKP)
- Internet Security Research Group (ISRG)
- Man-in-The-Middle Attack (MiTM Attack)
- Run-time Application Security Protection (RASP)
- Simple Public-Key Infrastructure (SPKI)
- TLS Authentication Record (TLSA Record)

## Terms

- HPKP Suicide
- Obfuscate Smali
- RansomPKP
- Threat Modeling

## Cyberattack

- ARP Cache Poisoning (a.k.a. ARP spoofing)
- DNS Poisoning (a.k.a. DNS Spoofing)

## SSL Unpinning

- [Android](./android.md)

<!-- ## Tips -->

<!-- ### Cert Manager -->

<!--
https://github.com/cert-manager/cert-manager/issues/2402
https://github.com/cert-manager/cert-manager/issues/2239
https://github.com/cert-manager/cert-manager/issues/3954
-->

<!-- ```sh
#
kubectl get certificate
```

```yml
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: letsencrypt-cert
spec:
  dnsNames:
    - 'example.com'
    - '*.example.com'
  secretName: letsencrypt-cert-secret
  issuerRef:
    name: example-letsencrypt
  privateKey:
    rotationPolicy: Never
``` -->
