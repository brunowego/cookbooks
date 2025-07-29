# Vercel Firewall

## Tips

### Bypass New Rule

<!--
https://github.com/vercel/community/discussions/7221
-->

1. Name: Allow Webhook by Header
2. Configure:
   - If: `Request Header` -> `X-Webhook-Secret` -> Equals -> `openssl rand -base64 32`
   - Rate Limit: `Fixed Window` -> `100` -> `10` -> `10`
   - Then: Log
