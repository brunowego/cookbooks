# OpenAI Files

## Links

- [Dashboard](https://platform.openai.com/storage/files)

## Tips

### Show Total Files

<!-- https://platform.openai.com/settings/organization/projects -->

```sh
#
export OPENAI_PROJECT='<proj_id>'

#
openai api files.list | jq -s 'length'
```
