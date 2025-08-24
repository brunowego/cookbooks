# AI Embedding Model

## Providers

- [Anthropic](https://docs.anthropic.com/en/docs/build-with-claude/embeddings)
- [OpenAI](https://platform.openai.com/docs/guides/embeddings/embedding-models)
- [Google Gemini](https://ai.google.dev/gemini-api/docs/embeddings)

## Most Used Ones

| Provider     | Model                    | Dim.  | Cost             | Multilingual | Best For                             |
| ------------ | ------------------------ | ----- | ---------------- | ------------ | ------------------------------------ |
| OpenAI       | `text-embedding-3-small` | 1,536 | \$               | No           | Fast, cheap embeddings               |
| OpenAI       | `text-embedding-3-large` | 3,072 | \$\$             | No           | High-accuracy search + RAG           |
| Cohere       | `embed-multilingual-v3`  | 1,024 | \$\$             | **Yes**      | Multilingual search + semantic tasks |
| Google       | `gecko-002`              | 768   | \$\$\$           | Yes          | Enterprise search                    |
| Hugging Face | `all-MiniLM-L6-v2`       | 384   | Free/self-hosted | Partial      | Cost-sensitive, open-source apps     |
| BAAI         | `bge-large-en-v1.5`      | 1,024 | Free/self-hosted | No           | Top benchmark performance            |
| E5           | `e5-large-v2`            | 1,024 | Free/self-hosted | **Yes**      | Multilingual + RAG pipelines         |
