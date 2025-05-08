# LangSmith

**Keywords:** Observability

## Links

- [Main Website](https://langchain.com/langsmith)
- [Dashboard](https://smith.langchain.com)

## Library

### Installation

```sh
pip install -U langchain langchain-openai
```

### Environment Variables

```sh
LANGCHAIN_TRACING_V2=true
LANGCHAIN_ENDPOINT="https://api.smith.langchain.com"
LANGCHAIN_API_KEY="<your-api-key>"
LANGCHAIN_PROJECT="<project-id>"
```

### Snippet

```py
from langchain_openai import ChatOpenAI

llm = ChatOpenAI()
llm.invoke("Hello, world!")
```
