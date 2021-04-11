# Django Authentication Using LDAP

## Library

### Installation

#### PIP

```sh
# As user dependency
pip3 install -U django-auth-ldap

# As project dependency
echo 'django-auth-ldap==2.3.0' >> ./requirements-test.txt

pip3 install \
  -r ./requirements-test.txt \
  -r ./requirements-dev.txt \
  -r ./requirements.txt
```

### Configuration

```py
AUTHENTICATION_BACKENDS = [
    'django_auth_ldap.backend.LDAPBackend',
]
```

<!--
https://pypi.org/project/django-auth-ldap/
-->
