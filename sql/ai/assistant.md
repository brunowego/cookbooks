# AI SQL Assistants

**Keywords:** SQL Research Assistant, Text-to-SQL

<!--
https://www.youtube.com/watch?v=N4nX_rTwKx4
-->

<!--
https://github.com/awesome-assistants/awesome-assistants
-->

<!--
https://github.com/Anakonn/langchain-v01/blob/0ef95b795ac9168e8b0cff1c9b79c3567ce65384/docs/templates/sql-research-assistant.md?plain=1#L4
https://github.com/LLMSecurity/HouYi/tree/master/langchain-templates/sql-research-assistant
https://github.com/Makesh-Srinivasan/langchain-gptr/blob/master/templates/sql-research-assistant/README.md?plain=1
https://github.com/ZCDu/langchain-read/tree/NOTE/templates/sql-research-assistant
https://github.com/pprados/langchain/tree/master/templates/sql-research-assistant
https://github.com/Palpatine0/SqlResearchAssistant/tree/master/sql-research-assistant
https://github.com/Makesh-Srinivasan/LangChain-GPT-Researcher/tree/master/templates/sql-research-assistant/sql_research_assistant
-->

## Glossary

- Retrieval-Augmented Generation (RAG)

## Tools

- [SQLAI.ai](/sqlai.ai.md)
- [Vanna.AI](/vanna.ai.md)

<!--
https://github.com/h2oai/sql-sidekick
https://datavisualizer.ai
-->

## Learn

- [SQL Assistant: Text-to-SQL Application in Streamlit](https://medium.com/@romina.elena.mendez/sql-assistant-text-to-sql-application-in-streamlit-b54f65d06b97) <!-- https://github.com/r0mymendez/text-to-sql -->

## Tips

### Prompt

```txt
You're advanced chatbot SQL Assistant. Your primary goal is to help users with SQL queries,
database management, and data analysis. Provide guidance on how to write efficient and accurate
SQL queries, and offer suggestions for optimizing database performance. Format output in Markdown.
```

```txt
I have a PostgreSQL database with the following schema:

-- Paste your schema here

I need help writing queries for the use cases I will describe in the next prompts.
```

### SQL Query to List Tables

**Dump:**

```sh
#
export DATABASE_URL='postgresql://user:password@localhost:5432/database'

#
pg_dump \
  -d "$DATABASE_URL" \
  -n public \
  -x \
  --schema-only \
  > ./dump-$(date -u '+%Y.%m.%d-%H%M').sql
```

**SQL Query:**

```sql
SELECT json_agg(
  json_build_object(
    'Table', TABLE_NAME,
    'Column', COLUMN_NAME,
    'Type', DATA_TYPE
  )
) AS database_structure
FROM INFORMATION_SCHEMA.COLUMNS
WHERE NOT (
    table_schema = 'pg_catalog'
    OR table_schema = 'information_schema'
  )
  AND table_schema = 'public';
```
