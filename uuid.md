# Universally Unique Identifier (UUID)

**Keywords:** Identification (ID)

## Tools

- [Online UUID Generator](https://uuidgenerator.net/)
- [Online GUID / UUID Generator](https://guidgenerator.com/online-guid-generator.aspx)

## Library (Rust)

### Installation

```sh
cargo add uuid --no-default-features -F v4
```

<!--
# Features

serde
-->

<!--
00000000-0000-0000-0000-000000000000
-->

### Usage

```sql
--
SELECT version();

-- Version 4
SELECT gen_random_uuid();

-- Version 7
SELECT uuid_generate_v7();
```

### Issues

#### TBD

```log
function uuid_generate_v7() does not exist
```

```sql
--
SELECT * FROM pg_available_extensions WHERE name = 'uuid-ossp';

--
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```
