# Poedit

## References

- [GNU Gettext](/gnu_gettext.md)

## App

### Installation

#### Homebrew

```sh
brew cask install poedit
```

###

```txt
__, _e, _n, _x, _ex, _nx, esc_attr__, esc_attr_e, esc_attr_x, esc_html__, esc_html_e, esc_html_x, _n_noop, _nx_noop, translate_nooped_plural
```

### Docs

#### Configure Theme Language for WordPress

1. Open theme `.pot` file:

   ```sh
   # Darwin
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

#### Language Translator

1. File -> New From POT/PO File...
   - Select `/path/to/wordpress/wp-content/themes/languages/[name].pot`
   - Language of the translation: Portuguese (Brazil)
   - Ok
2. File -> Save
   - Save As: pt_BR.po
   - Save

#### Configure Theme Language for Django

1. Open theme `.pot` file:

   ```sh
   # Darwin
   open ./locale/pt-br/LC_MESSAGES/django.po
   ```

2. Catalog -> Properties...
   - Sources Paths
     - Paths -> Add Folders
     - Add root theme folder (e.g. `/path/to/django/locale/pt-br/LC_MESSAGES/[name]`)
   - Sources Keywords
     - Additional keywords
       - `__`
       - `_e`
       - `_n:1,2`
       - `_x:1,2c`
       - `_ex:1,2c`
   - Ok
3. Catalog -> Update from Source Code -> Save
