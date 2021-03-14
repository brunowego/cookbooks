# krbcontext

## Library

### Dependencies

- [GSSAPI (Generic Security Services API)](/gssapi.md)

### Installation

```sh
# As user dependency
pip3 install -U krbcontext

# As project dependency
echo 'krbcontext==0.10' >> ./requirements.txt
```

### REPL

```py
>>> from krbcontext.context import krbContext
>>>
>>> with krbContext(using_keytab=True, principal='[username]@[REALM]', keytab_file='/etc/security/keytabs/[name].keytab', ccache_file='/tmp/krb5cc_pid_appname'):
...     pass
>>> exit()
```
