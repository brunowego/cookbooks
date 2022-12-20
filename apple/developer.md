# Apple Developer

## Link

- [Main Website](https://developer.apple.com)

## Related

- [Apple Store](./store/README.md)

## Console

- [Account](https://developer.apple.com/account/)
- [Certificates, Identifiers & Profiles](https://developer.apple.com/account/resources/)

## Glossary

- To This (Ad Hoc)
- Unique Disability ID (UDID)

## Tips

### Create Apple Distribution

**Open Keychain Access:**

1. Menu "Keychain Access" -> Certificate Assistant -> Request a Certificate From a Certificate Authority...
2. Certificate information
   - User Email Address: `<email>`
   - Request is: Check "Saved to disk"
   - Continue

**Open Apple Developer:**

1. Access [Certificates, Identifiers & Profiles](https://developer.apple.com/account/resources/)
2. Certificates -> Create a New Certificate -> Software session -> Check "Apple Distribution" -> Continue
3. Create a New Certificate -> Choose File -> Continue
4. Download Your Certificate -> Download
5. Open downloaded certificate and import into Keychain Access

### Create Provisioning Profile

**Type App Store:**

1. Access [Certificates, Identifiers & Profiles](https://developer.apple.com/account/resources/)
2. Profiles -> Generate a profile
3. Register a New Provisioning Profile -> Distribution -> Check App Store -> Continue
4. Create a Provisioning Profile
   - Select an App ID -> Continue
   - Select Certificates -> Continue
   - Review, Name and Generate -> Provisioning Profile Name: `AppIOSDistProfile` -> Generate
   - Download and Install -> Download
5. Open download profile

**Type App Store:**

1. Access [Certificates, Identifiers & Profiles](https://developer.apple.com/account/resources/)
2. Profiles -> Generate a profile
3. Register a New Provisioning Profile -> Distribution -> Check Ad Hoc -> Continue
4. Create a Provisioning Profile
   - Select an App ID -> Continue
   - Select Certificates -> Continue
   - Select Devices -> Check "Select All" -> Continue
   - Review, Name and Generate -> Provisioning Profile Name: `AppIOSAdHocProfile` -> Generate
   - Download and Install -> Download
5. Open download profile

### Product Archive

1. Open Xcode
2. Select in Simulators -> Build / Any iOS Device (arm64)
3. Product -> Archive
4. Archives -> Distribute App
   - Select a method of distribution: App Store Connect -> Next
   - Done

### Create Device

1. Access [Certificates, Identifiers & Profiles](https://developer.apple.com/account/resources/)
2. Devices -> Register a New Device
3. Register a Device section
   - Device Name: `<Name>’s iPhone`
   - Device ID (UDID)
   - Continue
4. Register a New Device -> Register
5. Registration Complete -> Done

### Get Device UDID

1. Open Xcode
2. Select in Simulators -> iOS Device
3. Window -> Device and Simulators
4. Devices tab -> Identifier

### Apple Certificates Location

**macOS:**

1. Keychain Access
2. Default Keychains -> login
3. My Certificates
