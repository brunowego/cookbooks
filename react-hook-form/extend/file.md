# Extend with File

```tsx
<FormField
  control={control}
  name="picture"
  render={({ field: { onChange, ...field } }) => (
    <FormItem>
      <FormLabel>Picture</FormLabel>

      <FormControl>
        <Input
          accept="image/jpg, image/jpeg, image/png"
          onChange={(event) => onChange(event.target.files?.[0])}
          placeholder="Picture"
          type="file"
          {...field}
        />
      </FormControl>

      <FormMessage />
    </FormItem>
  )}
/>
```
