# Example

**Refer:** `./test/e2e/api/graphql/user.spec.ts`

```ts
import it, { expect } from '@playwright/test'

const GRAPHQL_ENDPOINT = '/api/graphql'
const gql = String.raw

describe('React App', () => {
  it('get multiple users', async ({ request }) => {
    const response = await request.post(GRAPHQL_ENDPOINT, {
      data: {
        query: gql`
          {
            users {
              edges {
                node {
                  id
                }
              }
            }
          }
        `,
      },
    })
    const result = await response.json()

    expect(result.data.users.edges.length).toBe(1)
  })

  it('get single user', async ({ request }) => {
    const response = await request.post(GRAPHQL_ENDPOINT, {
      data: {
        query: gql`
          query Get($id: String!) {
            user(id: $id) {
              username
            }
          }
        `,
        variables: {
          id: '0f591484-fd1d-4aba-a3c4-5bf1f8cd5351',
        },
      },
    })
    const result = await response.json()

    expect(result.data.user.username).toBe('admin')
  })

  it('should edit username', async ({ request }) => {
    const response = await request.post(GRAPHQL_ENDPOINT, {
      data: {
        query: gql`
          mutation Edit($data: EditUserInput!) {
            editUser(input: $data) {
              username
            }
          }
        `,
        variables: {
          data: {
            id: '0f591484-fd1d-4aba-a3c4-5bf1f8cd5351',
            username: 'superuser',
          },
        },
      },
    })
    const result = await response.json()

    expect(result.data.editUser.username).toBe('superuser')
  })

  it('should delete user', async ({ request }) => {
    const response = await request.post(GRAPHQL_ENDPOINT, {
      data: {
        query: gql`
          mutation Delete($data: DeleteUserInput!) {
            deleteUser(input: $data)
          }
        `,
        variables: {
          data: { id: '0f591484-fd1d-4aba-a3c4-5bf1f8cd5351' },
        },
      },
    })
    const result = await response.json()

    expect(result.data.deleteUser).toBe('SUCCESS')
  })
})
```
