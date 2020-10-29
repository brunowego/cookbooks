# DBeaver Community

## App

### Dependencies

- [OpenJDK](/openjdk.md)

### Installation

#### Homebrew

```sh
brew cask install dbeaver-community
```

#### RPM

```sh
curl -LO 'https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm'
sudo rpm -vi ./dbeaver-ce-latest-stable.x86_64.rpm && rm -f ./dbeaver-ce-latest-stable.x86_64.rpm
```

#### DPKG

```sh
curl -LO 'https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb'
sudo dpkg -i ./dbeaver-ce_latest_amd64.deb && rm -f ./dbeaver-ce_latest_amd64.deb
```

#### Chocolatey

```sh
choco install -y dbeaver
```

### Connections

#### MongoDB

1. File
2. New
3. Database Connection
4. MongoDB

| Parameter | Value
| --- | --- |
| Mechanism | `SCRAM-SHA-1` |

- Driver properties tab
  - Connection
    - \[Check] Single node mode

#### DB2 for z/OS

```txt
jdbc:db2://<HOST>:<PORT>/<DATABASE>:defaultIsolationLevel=1;readOnly=true;currentSchema=<SCHEMA>;
```

Or:

1. Edit Connection
2. General -> Schemas/Users
   - Check: Enable
   - Include -> Add

### Tips

<!--
####

~/Library/DBeaverData/workspace6/General/.dbeaver/credentials-config.json

https://gist.github.com/felipou/50b60309f99b70b1e28f6d22da5d8e61
-->

#### Dark theme

1. Preferences
2. General
3. Appearance
4. Theme: Dark

#### Client

- Finder - Go to Folder: `Command` + `Shift` + `G`

```sh
# MySQL
echo $(dirname $(which mysqldump))

# PostgreSQL
echo $(dirname $(which pg_dump))
```

1. Edit Connection
2. Local Client:
3. Add Home
4. Copy MySQL Path

#### Kerberos

```sh
# Darwin
tee -a /Applications/DBeaver.app/Contents/Eclipse/dbeaver.ini << EOF
-Dsun.security.krb5.debug=true
-Djava.security.krb5.conf=/etc/krb5.conf
-Djavax.security.auth.useSubjectCredsOnly=false
EOF

# Linux
tee -a /usr/share/dbeaver/dbeaver.ini << EOF
-Dsun.security.krb5.debug=true
-Djava.security.krb5.conf=/etc/krb5.conf
-Djavax.security.auth.useSubjectCredsOnly=false
EOF
```

> Change `DBeaver.app` to `DBeaverEE.app` for enterprise edition.

##### Connection

###### Hive Server2

```txt
jdbc:hive2://[hostname]:10000/default;principal=[username]/[FQDN]@[REALM]
```

> Use `_HOST` instead of `FQDN` when have keytab initialized.

###### Using ZooKeeper

```txt
jdbc:hive2://[hostname]:2181/default;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2
```

### Issues

#### Authentication Failed

```log
Command failed with error 18 (AuthenticationFailed): 'Authentication failed.' on server 127.0.0.1:27017. The full response is {"ok": 0.0, "errmsg": "Authentication failed.", "code": 18, "codeName": "AuthenticationFailed"}
```

Change `Database:` to `admin`.

### Logs

```sh
# Unix-like
tail -f ~/.dbeaver4/.metadata/dbeaver-debug.log

# Windows
C:\Users\[user]\.dbeaver4\.metadata\dbeaver-debug.log
```
