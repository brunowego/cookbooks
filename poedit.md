# Poedit

## App

### Installation

#### Homebrew

```sh
brew cask install poedit
```

### Docs

#### Configure Theme Language

1. Open theme `.pot` file:

   ```sh
   open ./languages/*.pot
   ```

2. Catalog -> Properties...
   - Sources Paths
     - Paths -> Add Folders
     - Add root theme folder (e.g. `/path/to/wordpress/wp-content/themes/[name]`)
     - Excluded paths -> Add Folders -> node_modules/
   - Sources Keywords
     - Additional keywords
       - `__`
       - `_e`
       - `_n:1,2`
       - `_x:1,2c`
       - `_ex:1,2c`
   - Ok
3. Catalog -> Update from Source Code -> Save

```txt
__, _e, _n, _x, _ex, _nx, esc_attr__, esc_attr_e, esc_attr_x, esc_html__, esc_html_e, esc_html_x, _n_noop, _nx_noop, translate_nooped_plural
```

#### Language Translator

1. File -> New From POT/PO File...
   - Select `/path/to/wordpress/wp-content/themes/languages/[name].pot`
   - Language of the translation: Portuguese (Brazil)
   - Ok
2. File -> Save
   - Save As: pt_BR.po
   - Save
