# IEEE 802.1X

## Dependencies

### Darwin

- [Apple Configurator 2](/apple_configurator.md)

## Configuration

### Linux

1. Security
2. Authentication (Select): Protected EAP (PEAP)
3. Check: No CA certificate is required
4. Authentication (Select): MSCHAPv2
5. Username:
6. Password:
7. Apply

### Darwin

1. Open Apple Configurator 2
2. File -> New Profile
3. Nale: Ethernet
4. Organization:
5. Description: 802.1x Network Authentication
6. Consent Message: 802.1x Network Authentication
7. Tab Wi-Fi
8. Service Set Identifier (SSID): Ethernet
9. Uncheck: Auto Join
10. Security Type: WPA2 Enterprise
11. Accepted EAP Types (Check): PEAP
12. User Name:
13. Password:
14. File -> Save

### Windows

TODO
