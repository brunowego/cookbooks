# Apache Directory Studio

## Installation

### Homebrew

```sh
brew cask install apache-directory-studio
```

## Configuration

### LDAP

#### Connection

1. Network Parameter
   - Connection name:
   - Hostname:
   - Port: 636
   - Encryption method: Use SSL encryption (ldaps://)
2. Authentication: Type "Bind DN or user" and "Bind password"
3. Browser Options: Check "Features -> Fetch operational attributes while browsing"
4. Finish

#### Search

1. Type "Search Name"
2. Select "Connection"
3. Browse "Search Base"
4. Filter "(uid=*)"
5. Check "Scope -> Subtree"
6. Apply and Close
