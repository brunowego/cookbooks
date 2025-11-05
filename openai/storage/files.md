# OpenAI Files

## Links

- [Dashboard](https://platform.openai.com/storage/files)

## Tips

### File Limits

- 512 MB per file
- 100 GB per organization
- 20 files per assistant

<!--
https://api.openai.com/v1/files
-->

<!--
https://community.openai.com/t/ai-assistants-file-limits/566434?utm_source=chatgpt.com
-->

### Show Total Files

<!-- https://platform.openai.com/settings/organization/projects -->

```sh
#
openai api models.list

#
export OPENAI_PROJECT='<proj_id>'

#
openai api files.list | jq -s 'length'
```

<!--
openai api files.retrieve -i <file-id>
-->
