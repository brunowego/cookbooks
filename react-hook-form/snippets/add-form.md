# Add Form

**Refer:** `./schemas.ts`

```ts
import z from 'zod'

export const contactSchema = z.object({
  firstName: z.string().min(1),
  lastName: z.string(),
  email: z.string().email(),
  phone: z.string().min(10),
  message: z.string().min(20),
})
```

**Refer:** `./components/contact-form.tsx`

```tsx
'use client'

import type { HTMLAttributes, JSX } from 'react'
import { useMutation } from '@tanstack/react-query'

import { type z, zodResolver } from '@feedit/ui/lib/zod'
import { useForm, type SubmitHandler } from '@feedit/ui/hooks/use-form'
import toast from '@feedit/ui/lib/toast'
import Form from '@feedit/ui/components/form'
import cn from '@feedit/ui/utils/cn'
import Input from '@feedit/ui/components/input'
import Textarea from '@feedit/ui/components/textarea'
import Button from '@feedit/ui/components/button'
import { Loader2 } from '@feedit/ui/components/icon'

import { contactSchema } from '@/schemas'
import api from '@/lib/api'
import { handleError } from '@/utils/handles'
import HookFormDevtool from '@/components/hookform-devtool'

const formSchema = contactSchema.pick({
  firstName: true,
  lastName: true,
  email: true,
  phone: true,
  message: true,
})

type FormValues = z.infer<typeof formSchema>

type ContactFormProps = HTMLAttributes<HTMLFormElement>

export default function ContactForm({
  className,
  ...props
}: ContactFormProps): JSX.Element {
  const { reset, formState, handleSubmit, control, ...form } =
    useForm<FormValues>({
      mode: 'onBlur',
      defaultValues: {
        firstName: '',
        lastName: '',
        email: '',
        phone: '',
        message: '',
      },
      resolver: zodResolver(formSchema),
    })

  const { mutateAsync } = useMutation({
    mutationFn: (values: FormValues) => {
      return api.post('/contact', values)
    },
    onError(error) {
      toast.error(
        handleError(
          error,
          'Ocorreu um erro ao enviar sua mensagem, tente novamente mais tarde :('
        )
      )
    },
    onSuccess: () => {
      reset()

      toast.success('Sua mensagem foi enviada com sucesso! 🎉')
    },
  })

  const onSubmit: SubmitHandler<FormValues> = async (values: FormValues) => {
    try {
      await mutateAsync(values)
    } catch (err) {
      if (process.env.NODE_ENV === 'development') {
        console.error(err)
      }
    }
  }

  return (
    <>
      <HookFormDevtool control={control} />

      <Form {...{ reset, formState, handleSubmit, control, ...form }}>
        <form
          className={cn('space-y-6', className)}
          onSubmit={handleSubmit(onSubmit)}
          {...props}
        >
          <div className="grid grid-cols-2 space-x-4">
            <Form.Field
              control={control}
              name="firstName"
              render={({ field, fieldState: { error } }) => (
                <Form.Item>
                  <Form.Label className="mx-4">Nome</Form.Label>

                  <Form.Control>
                    <Input
                      className={cn(
                        'bg-white dark:bg-input',
                        error && 'border-destructive'
                      )}
                      type="text"
                      {...field}
                    />
                  </Form.Control>

                  <Form.Message className="mx-4" />
                </Form.Item>
              )}
            />

            <Form.Field
              control={control}
              name="lastName"
              render={({ field, fieldState: { error } }) => (
                <Form.Item>
                  <Form.Label className="mx-4">Sobrenome</Form.Label>

                  <Form.Control>
                    <Input
                      className={cn(
                        'bg-white dark:bg-input',
                        error && 'border-destructive'
                      )}
                      type="text"
                      {...field}
                    />
                  </Form.Control>

                  <Form.Message className="mx-4" />
                </Form.Item>
              )}
            />
          </div>

          <div className="grid grid-cols-2 space-x-4">
            <Form.Field
              control={control}
              name="email"
              render={({ field, fieldState: { error } }) => (
                <Form.Item>
                  <Form.Label className="mx-4">E-mail corporativo</Form.Label>

                  <Form.Control>
                    <Input
                      className={cn(
                        'bg-white dark:bg-input',
                        error && 'border-destructive'
                      )}
                      type="email"
                      {...field}
                    />
                  </Form.Control>

                  <Form.Message className="mx-4" />
                </Form.Item>
              )}
            />

            <Form.Field
              control={control}
              name="phone"
              render={({ field, fieldState: { error } }) => (
                <Form.Item>
                  <Form.Label className="mx-4">Número telefone</Form.Label>

                  <Form.Control>
                    <Input
                      className={cn(
                        'bg-white dark:bg-input',
                        error && 'border-destructive'
                      )}
                      type="text"
                      {...field}
                    />
                  </Form.Control>

                  <Form.Message className="mx-4" />
                </Form.Item>
              )}
            />
          </div>

          <Form.Field
            control={control}
            name="message"
            render={({ field, fieldState: { error } }) => (
              <Form.Item>
                <Form.Label className="mx-4">Como podemos ajudar?</Form.Label>

                <Form.Control>
                  <Textarea
                    className={cn(
                      'resize-none bg-white dark:bg-input',
                      error && 'border-destructive'
                    )}
                    {...field}
                  />
                </Form.Control>

                <Form.Message className="mx-4" />
              </Form.Item>
            )}
          />

          <Button
            className="w-full gap-x-2"
            disabled={!formState.isDirty || !formState.isValid}
            size="xl"
            type="submit"
          >
            <span>Enviar mensagem</span>

            {formState.isSubmitting ? (
              <Loader2 className="size-5 animate-spin" />
            ) : null}
          </Button>
        </form>
      </Form>
    </>
  )
}
```
