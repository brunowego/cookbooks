# GraphCMS

## Links

- [Main Website](https://graphcms.com)
- [Management API](https://management-next.graphcms.com/graphql)

## Guides

- [Field Types](https://graphcms.com/docs/api-reference/schema/field-types)

## Content

- [Next.js with GraphCMS: Static Site Generation & API Routes](https://graphcms.com/blog/nextjs-graphcms-ssg-api-routes)

## Bootstrap

### Project

1. [GraphCMS](https://app.graphcms.com) -> Create a new project -> Blank
   - Project name: Platform
   - Select US East (N. Virginia)
   - Create project
2. Select Community Free forever PLan -> Select plan
3. Invite later

### Schema

#### Seo

1. Schema -> Models -> Add
   - Display name: Seo
   - Create Model
2. Add Fields
   - Single line text: Title
     - Use as title field
     - Create
   - Single line text: Description
     - Create

#### Page

1. Schema -> Models -> Add
   - Display name: Page
   - Create Model
2. Add Fields
   - Single line text: Title
     - Use as title field
     - Create
   - Slug: Slug
     - Create
   - Single line text: Subtitle
     - Create
   - Reference
     - Model to reference: Seo
     - Continue
     - Create

### Content

1. Create item
   - Title: Blog
   - Slug: blog
   - Subtitle: My awesome posts!
   - Seo -> Create & add new Seo
     - Title: Blog
     - Description: My awesome posts!
     - Save & publish
   - Save & publish

### API playground

```gql
query Page {
  page(where: { slug: "blog" }) {
    title
    subtitle
    seo {
      title
      description
    }
  }
}
```

```gql
query Pages {
  pages(orderBy: publishedAt_DESC) {
    title
    subtitle
  }
}
```

## Configuration

### Public Content API

1. Projects Settings
2. Access -> API Access -> Public Content API -> Yes, initialize defaults
