# Change shell (chsh)

## Example

```sh
# current user
sudo chsh -s `which bash`

# define user
sudo chsh "$USER" -s /bin/bash
```

```sh
# reload alternatives
exec /bin/bash
exec `which bash`
exec $SHELL
```
