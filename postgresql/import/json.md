# PostgreSQL Import JSON

<!--
https://withdata.com/file-to-db

https://github.com/lukasmartinelli/pgfutter
-->

## Tips

### Sling

```sh
#
export DATABASE_URL='postgresql://...'

#
cat ./<filename>.json | \
  sling run \
    --src-options 'flatten: true' \
    --tgt-conn DATABASE_URL \
    --tgt-object public.<table-name> \
    -m full-refresh
```

### TBD

```py
import psycopg2
import json

conn = psycopg2.connect(dbname="your_database", user="your_username", password="your_password", host="your_host", port="your_port")
cur = conn.cursor()

with open('produtos.json') as f:
    data = json.load(f)

for produto in data:
    cur.execute("INSERT INTO produtos (produto_id, nome, preco, categoria) VALUES (%s, %s, %s, %s)",
               (produto['produto_id'], produto['nome'], produto['preco'], produto['categoria']))

    cur.execute("INSERT INTO fornecedores (fornecedor_id, nome) VALUES (%s, %s)",
               (produto['fornecedor']['fornecedor_id'], produto['fornecedor']['nome']))

conn.commit()

cur.close()
conn.close()
```
