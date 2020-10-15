# PyMySQL

## Library

### Dependencies

- [MySQL](/mysql.md#Docker)
- [Python 3](/python3.md#Docker)

### Installation

```sh
# As user dependency
pip install -U PyMySQL

# As project dependency
echo 'PyMySQL==0.10.1' >> ./requirements.txt
```

### REPL

```py
>>> import pymysql
>>>
>>> conn = pymysql.connect(user='user', password='pass', host='127.0.0.1')
>>>
>>> cur = conn.cursor()
>>> cur.execute('SELECT CURRENT_TIMESTAMP')
>>> cur.fetchone()
>>> cur.close()
>>>
>>> conn.close()
>>> exit()
```
