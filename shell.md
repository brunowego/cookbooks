# Shell

## Usage

```sh
#
echo $SHELL
```

## Tips

### History Size

```sh
#
echo $HISTSIZE
echo $SAVEHIST

# ~/.zshrc

# History Size
export HISTSIZE=1000000 # 100,000 commands kept in memory
export SAVEHIST=1000000 # 100,000 commands saved to ~/.zsh_history
```
