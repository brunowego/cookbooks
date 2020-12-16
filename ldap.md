# Lightweight Directory Access Protocol (LDAP)

## Tools

- [slapcat](/slapcat.md)

## Related

- [OpenLDAP](/openldap.md)

## References

- Port 389 and 636 (SSL)

## Tips

### TCP State

```sh
nmap -p 389,636 [hostname]
```

### SSH Tunnel

```sh
ssh \
  -p [port] \
  -N \
  -L 3389:[hostname]:389 \
  [username]@[hostname]

ldapsearch -x \
  -H 'ldap://127.0.0.1:3389' \
  -b 'dc=example,dc=com' \
  -D 'cn=admin,dc=example,dc=com' \
  -w admin
```

<!-- ## Tips

###

```sh
sudo apt -y install python-ldap

sudo zypper install -y python3-ldap

pip install python-ldap
```

```py
import ldap
from ldap.controls import SimplePagedResultsControl

hostname = 'ldp0pb1.bb.com.br'
port = '389'
username = 'uid=big02usr,ou=bind,ou=usuarios,ou=acesso,o=bb,c=br'
password = 'u3it5pe6'
base_dn = 'o=BB,c=BR'

conn = ldap.initialize(f"ldap://{hostname}:{port}")
conn.set_option(ldap.OPT_REFERRALS, 0)
conn.simple_bind_s(username, password)

search_flt = '(uid=*)'
page_size = 100
searchreq_attrlist = ['givenname', 'sn', 'mail']
req_ctrl = SimplePagedResultsControl(criticality=True, size=page_size, cookie='')
msgid = conn.search_ext_s(base=base_dn, scope=ldap.SCOPE_SUBTREE, filterstr=search_flt, attrlist=searchreq_attrlist, serverctrls=[req_ctrl])

total_results = []
pages = 0

while True:
    pages += 1
    rtype, rdata, rmsgid, serverctrls = conn.result3(msgid)
    total_results.extend(rdata)
    pctrls = [c for c in serverctrls if c.controlType == SimplePagedResultsControl.controlType]

    if pctrls:
        if pctrls[0].cookie:
            req_ctrl.cookie = pctrls[0].cookie
            msgid = conn.search_ext_s(base=base_dn, scope=ldap.SCOPE_SUBTREE, filterstr=search_flt, attrlist=searchreq_attrlist, serverctrls=[req_ctrl])
        else:
            break
    else:
        break

conn.unbind()

print(total_results)

# TODO: save as csv file
``` -->
