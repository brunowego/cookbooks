# react-hot-toast

<!--
https://fkhadra.github.io/react-toastify/
-->

## Links

- [Code Repository](https://react-hot-toast.com)

<!--
Refer: app/layout.tsx

import { Toaster } from 'react-hot-toast'

<Toaster position='top-center' reverseOrder={false} />

---

Refer: page.tsx

import { toast } from 'react-hot-toast'

const { mutate, isLoading } = api.waitlist.addEmailToWaitList.useMutation({
  onError: (error) => {
    toast.error(error.message)
  },
  onSuccess: () => {
    toast.success(
      'Thanks for signing up to our waitlist, we will be in touch shortly when Splendal becomes available. Until then, you can follow us on twitter for all updates.',
    )
  },
})
-->
