# requests-kerberos

<!--
https://pypi.org/project/requests-kerberos/
https://github.com/whg517/StudySpark/blob/08f69c0b9e5ad75d86710187ba393b93b43ee7b9/tmp/d1.py
https://hadoopandspark.wordpress.com/2018/04/11/pyspark-an-error-occurred-while-calling-none-org-apache-spark-api-java-javasparkcontext/
-->

## Library

### Dependencies

- [GSSAPI (Generic Security Services API)](/gssapi.md)

### Installation

```sh
# As user dependency
pip3 install -U \
  requests \
  requests-kerberos

# As project dependency
cat << EOF >> ./requirements.txt
requests==2.25.1
requests-kerberos==0.12.0
EOF
```

### REPL

```sh
#
echo '[password]' | kinit [username]@[REALM]

#
klist -l
```

```py
>>> import requests
>>> from requests_kerberos import HTTPKerberosAuth, REQUIRED
>>>
>>> kerberos_auth = HTTPKerberosAuth(mutual_authentication=REQUIRED)
>>>
>>> r = requests.get('http://[hostname]', auth=kerberos_auth)
>>> r.status_code
>>> exit()
```

```sh
kdestroy -c $(klist -l | grep -i [principal-name] | awk '{print $NF}')
```
