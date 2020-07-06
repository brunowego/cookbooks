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
     - New Item: `__`
     - New Item: `_e`
     - New Item: `esc_html_e`
     - New Item: `esc_attr_x`
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
