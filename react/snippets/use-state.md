# useState

## Snippet

<!--
https://www.youtube.com/watch?v=ukpgxEemXsk
-->

<!--
Mistakes:

- Derived State
-->

```ts
//
interface Filters {
  createdAt?: Date
}

const [filters, setFilters] = useState<Filters>({
  createdAt: undefined,
})

//
const [isModalOpen, setIsModalOpen] = useState<boolean>(false)
```
