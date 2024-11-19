# tsvector

<!--
ALTER TABLE users ADD COLUMN search_vector tsvector;

UPDATE users SET search_vector = to_tsvector('english', first_name || ' ' || last_name);

CREATE INDEX idx_search_vector ON users USING GIN(search_vector);

SELECT id, first_name, last_name
FROM users
WHERE search_vector @@ plainto_tsquery('english', 'C.R Jackson')
ORDER BY ts_rank(search_vector, plainto_tsquery('english', 'C.R Jackson')) DESC;
-->

TODO
