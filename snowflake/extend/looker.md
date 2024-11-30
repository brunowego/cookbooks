# Extend with Looker

## TBD

```sql
CREATE ROLE looker_role;

CREATE USER looker_user PASSWORD = '<password>';

GRANT ROLE looker_role TO USER looker_user;

SHOW WAREHOUSES;

-- e.g. compute_wh
ALTER USER looker_user SET DEFAULT_WAREHOUSE = '<warehouse-name>';

CREATE SECURITY INTEGRATION looker_oauth
  TYPE = OAUTH
  ENABLED = TRUE
  OAUTH_CLIENT = LOOKER
  OAUTH_REDIRECT_URI = 'https://<looker_instance>/auth/snowflake/callback';
```
