# pgcrypto

## Usage

```sql
-- Show enabled extensions
SELECT extname FROM pg_extension;

-- Create pgcrypto extension
CREATE EXTENSION IF NOT EXISTS pgcrypto;
```

## Tips

### Run Through CLI

```sh
#
psql -h 127.0.0.1 -U dev -c "SELECT extname FROM pg_extension"

#
psql -h 127.0.0.1 -U dev -c "CREATE EXTENSION IF NOT EXISTS pgcrypto"
```
