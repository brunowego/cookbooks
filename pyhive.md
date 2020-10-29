# PyHive

## Library

### Installation

```sh
# As user dependency
pip install -U thrift sasl thrift_sasl pyhive

# As project dependency
cat << EOF >> ./requirements.txt
thrift==0.13.0
sasl==0.2.1
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
#
echo '[password]' | kinit [username]@[REALM]

#
klist
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
