# PostgreSQL Anonymizer (a.k.a. anon)

<!--
https://github.com/TantorLabs/pg_anon
-->

**Keywords:** Anonymization, Data Masking

## Links

- [Code Repository](https://gitlab.com/dalibo/postgresql_anonymizer)
- [Main Website](https://labs.dalibo.com/postgresql_anonymizer)

## Learn

- [FOSDEM 2025 - PostgreSQL Anonymizer and the Battle for Privacy / Damien Clochard](https://youtube.com/watch?v=QXdARUK9r-0)

<!--
-- Instala a extensão
CREATE EXTENSION anon;

-- Define políticas de anonimização
SELECT anon.anonymize_column('users', 'email', 'anon.email()');
SELECT anon.anonymize_column('users', 'name', 'anon.fake_full_name()');
SELECT anon.anonymize_column('users', 'phone', 'anon.numeric_string(11)');

-- Aplica anonimização na tabela
SELECT anon.anonymize_table('users');
-->
