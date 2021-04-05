# PyHive

<!--
https://medium.com/random-life-journal/python-restful-api-server-for-apache-hive-6bc52ad991ba
-->

## Library

### Dependencies

**Through Kerberos**

- [GSSAPI (Generic Security Services API)](/gssapi.md)

### Installation

```sh
# As user dependency
pip3 install -U \
  thrift \
  pyhive

# As project dependency
cat << EOF >> ./requirements.txt
thrift==0.13.0
PyHive==0.6.3
EOF
```

### REPL

**Through LDAP**

```py
>>> from pyhive import hive
>>>
>>> conn = hive.connect(host='127.0.0.1', port=10000, database='default', username='[username]', password='[password]', auth='CUSTOM')
>>>
>>> cur = conn.cursor()
>>> cur.execute('SELECT CURRENT_TIMESTAMP')
>>> cur.fetchone()
>>> cur.close()
>>>
>>> conn.close()
>>> exit()
```

**Through Kerberos**

```sh
# As user dependency
pip3 install -U \
  sasl \
  thrift-sasl

# As project dependency
cat << EOF >> ./requirements.txt
sasl==0.2.1
thrift-sasl==0.4.2
EOF
```

```sh
#
echo '[password]' | kinit [username]@[REALM]

#
klist -l
```

```py
>>> from pyhive import hive
>>>
>>> conn = hive.connect(host='127.0.0.1', port=10000, database='default', username='[username]', auth='KERBEROS', kerberos_service_name='hive')
>>>
>>> cur = conn.cursor()
>>> cur.execute('SELECT CURRENT_TIMESTAMP')
>>> cur.fetchone()
>>> cur.close()
>>>
>>> conn.close()
>>> exit()
```

```sh
kdestroy -c $(klist -l | grep -i [principal-name] | awk '{print $NF}')
```
