# Slack Integration with Sentry

## Links

- [Code Repository](https://github.com/getsentry/sentry/tree/master/src/sentry/integrations/slack)
- [Slack + Sentry Integration](https://sentry.io/integrations/slack)

## Learn

- [How to Integrate Sentry with Slack for Real-time Notifications](https://youtube.com/watch?v=nZFSqhI7fDI)

## Docs

### Add to Organization

1. [Organization Settings](https://sentry.io/settings/organization)
2. Integrations
3. Slack

### Add to Project

1. Main Menu "Settings"
2. Sidebar "Integrations"
3. Click in "Slack (Legacy)"
4. "Add to Project" Button
5. Select a project to continue
6. Type Plugin Configuration
   - Webhook URL:
   - Icon URL: `http://myovchev.github.io/sentry-slack/images/logo32.png`
   - Destination: `#my-channel`
   - Check "Include Tags"
   - Check "Include Rules"
   - Check "Exclude Culprit"
   - Save Changes
7. "Enable Plugin" Button at Top
