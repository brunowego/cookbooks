# Themes

## Configuration

**_Dependencies:_** [GNU Wget](/gnu/wget.md) and Vim.

```sh
#
mkdir -p ~/.vim/{colors,autoload}
```

## Colors

**Note:** The latest version of Vim has a built-in theme.

### Monokai

```sh
# Download
wget 'https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim' -P ~/.vim/colors

# Setting
echo -e 'syntax enable\ncolorscheme monokai' >> ~/.vimrc
```

### OneHalfDark

```sh
# Download
wget 'https://raw.githubusercontent.com/sonph/onehalf/master/vim/colors/onehalfdark.vim' -P ~/.vim/colors

# Setting
echo -e 'syntax enable\ncolorscheme onehalfdark' >> ~/.vimrc
```

### OneDark

```sh
# Download
wget 'https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim' -P ~/.vim/colors
wget 'https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim' -P ~/.vim/autoload

# Setting
echo -e 'syntax enable\ncolorscheme onedark' >> ~/.vimrc
```
