# OpenAI Vector Stores

## Links

- [Dashboard](https://platform.openai.com/storage/vector_stores)

## Tips

### Show Total Vector Stores

```sh
curl -s https://api.openai.com/v1/vector_stores \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  | jq '.data | length'
```
