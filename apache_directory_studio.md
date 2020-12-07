# Apache Directory Studio

## App

### Dependencies

- [cURL](/curl.md)
- [Java Standard Edition (SE)](/java-se-jdk.md#version-8-and-earlier)

### Installation

#### Homebrew

```sh
brew cask install apache-directory-studio
```

#### Linux

```sh
curl 'https://downloads.apache.org/directory/studio/2.0.0.v20200411-M15/ApacheDirectoryStudio-2.0.0.v20200411-M15-linux.gtk.x86_64.tar.gz' | sudo tar -xzC /opt

sudo ln -s /opt/ApacheDirectoryStudio/ApacheDirectoryStudio /usr/local/bin/ApacheDirectoryStudio
```

### Configuration

#### LDAP

##### Connection

1. File -> New -> LDAP Browser -> LDAP Connection
2. Network Parameter
   - Connection name:
   - Hostname:
   - Port: 636
   - Encryption method: Use SSL encryption (ldaps://)
3. Authentication: Type "Bind DN or user" and "Bind password"
4. Browser Options: Check "Features -> Fetch operational attributes while browsing"
5. Finish

##### Search

1. Type "Search Name"
2. Select "Connection"
3. Browse "Search Base"
4. Filter "(uid=*)"
5. Check "Scope -> Subtree"
6. Apply and Close
