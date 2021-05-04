# python-ldap

## Library

### Installation

```sh
# As user dependency
pip3 install -U python-ldap

# As project dependency
echo 'python-ldap==3.3.1' >> ./requirements.txt
```

### REPL

```py
>>> import ldap
>>>
>>> ldap.set_option(ldap.OPT_X_TLS_REQUIRE_CERT, ldap.OPT_X_TLS_NEVER)
>>>
>>> LDAP_URL = 'ldaps://127.0.0.1'
>>> LDAP_USERNAME = 'cn=admin,dc=example,dc=com'
>>> LDAP_PASSWORD = 'admin'
>>> LDAP_BASE_DN = 'dc=example,dc=com'
>>>
>>> L = ldap.initialize(LDAP_URL)
>>> L.simple_bind_s(LDAP_USERNAME, LDAP_PASSWORD)
>>> filter = '(uid=admin)'
>>> L.search_s(LDAP_BASE_DN, ldap.SCOPE_SUBTREE, filter)
>>> L.search_ext_s(LDAP_BASE_DN, ldap.SCOPE_SUBTREE, filter, ['displayName'])
>>> L.unbind()
>>>
>>> exit()
```

### Issues

#### Ignore Self Signed Certificate

```log
ldap.SERVER_DOWN: {'result': -1, 'desc': "Can't contact LDAP server", 'ctrls': [], 'info': 'error:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed (self signed certificate in certificate chain)'}
```

```py
import ldap

ldap.set_option(ldap.OPT_X_TLS_REQUIRE_CERT, ldap.OPT_X_TLS_NEVER)

l = ldap.initialize('ldaps://127.0.0.1')

# ...
```
