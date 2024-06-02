# External Field

## Links

- [Docs](https://puckeditor.com/docs/api-reference/fields/external)

## Snippet

```tsx
import type { ComponentConfig } from '@measured/puck'

export type ImageUploadProps = {
  data?: { title: string; description: string }[]
}

export const ImageUpload: ComponentConfig<ImageUploadProps> = {
  label: 'Image Upload',
  fields: {
    data: {
      type: 'external',
      fetchList: async () => {
        // ... fetch data from a third party API, or other async source

        return [
          { title: 'Hello, world', description: 'Lorem ipsum 1' },
          { title: 'Goodbye, world', description: 'Lorem ipsum 2' },
        ]
      },
    },
  },
  render: ({ data }) => {
    return <p>{data?.[0]?.title || 'No data selected'}</p>
  },
}
```
