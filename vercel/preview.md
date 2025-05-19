# Vercel Preview

## Tips

### TBD

```sh
#
git checkout <branch>

#
vercel link --cwd ./apps/app

#
cd ./apps/app

#
vercel deploy \
  --build-env NEXT_PUBLIC_API_BASE_URL=https://staging-api-pr-94.onrender.com

#
vercel alias --scope <org-name> set <deployment-url> <custom-url>
```
