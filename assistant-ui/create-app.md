# Create App

## Usage

### Automatic

```sh
# New Project
npx assistant-ui@latest create
#
npx assistant-ui@latest create -t langgraph
#
npx assistant-ui@latest create -t mcp

# Existing Project
npx assistant-ui@latest init
```

### Manual

```sh
#
pnpm add @ai-sdk/openai @assistant-ui/react @assistant-ui/react-ai-sdk @assistant-ui/react-markdown ai remark-gfm

npx shadcn@latest add https://r.assistant-ui.com/thread
npx shadcn@latest add https://r.assistant-ui.com/thread-list
npx shadcn@latest add https://r.assistant-ui.com/markdown-text
npx shadcn@latest add https://r.assistant-ui.com/tool-fallback
npx shadcn@latest add https://r.assistant-ui.com/tooltip-icon-button
```

<!--
npx shadcn@latest add -c ./packages/ui https://r.assistant-ui.com/thread
-->
