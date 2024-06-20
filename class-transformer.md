# class-transformer

**Keywords:** Objects-mapping, Serialization

## Links

- [class-transformer](https://github.com/typestack/class-transformer)
- [Docs](https://docs.typestack.community/class-transformer)

## Glossary

- Data Transfer Object (DTO)

## Snippets

```ts
//
@Expose({ name: 'domain' })
@Transform(({ value }) => value.domain)
domain!: string

//
@Expose({ name: 'integrations' })
@Transform(
  ({ value }) =>
    value.reduce(
      (acc: Record<string, string>, { type, data }: PageIntegration) =>
        Object.assign(acc, { [type]: data }),
      {},
    ),
  { toClassOnly: true },
)
integrations!: Record<string, string>
```
