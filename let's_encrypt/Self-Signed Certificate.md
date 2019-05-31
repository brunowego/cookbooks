# Self-Signed Certificate

```sh
keytool -keystore datalayer.jks -alias datalayer -genkey -keyalg RSA -sigalg SHA256withRSA -validity 365
```

```sh
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA -sigalg SHA256withRSA
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA -sigalg SHA256withRSA -ext 'SAN=dns:doc.datalayer.io,dns:*.datalayer.io'
```
