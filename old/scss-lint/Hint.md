# Hint

```sh
touch .scss-lint.yml || exit
```

```yml
# Default application configuration that all configurations inherit from.

scss_files: "**/*.scss"

linters:
  BangFormat:
    enabled: true
    space_before_bang: true
    space_after_bang: false

  BorderZero:
    enabled: true
    convention: zero # or `none`

  ColorKeyword:
    enabled: false

  ColorVariable:
    enabled: false

  Comment:
    enabled: true

  DebugStatement:
    enabled: true

  DeclarationOrder:
    enabled: true

  DuplicateProperty:
    enabled: true

  ElsePlacement:
    enabled: true
    style: new_line # or 'same_line'

  EmptyLineBetweenBlocks:
    enabled: true
    ignore_single_line_blocks: true

  EmptyRule:
    enabled: true

  FinalNewline:
    enabled: true
    present: true

  HexLength:
    enabled: true
    style: long # or 'short'

  HexNotation:
    enabled: true
    style: uppercase # or 'lowercase'

  HexValidation:
    enabled: true

  IdSelector:
    enabled: true

  ImportantRule:
    enabled: true

  ImportPath:
    enabled: true
    leading_underscore: false
    filename_extension: false

  Indentation:
    enabled: false
    allow_non_nested_indentation: false
    character: tab # or 'space'
    width: 1

  LeadingZero:
    enabled: true
    style: exclude_zero # or 'include_zero'

  MergeableSelector:
    enabled: true
    force_nesting: true

  NameFormat:
    enabled: true
    allow_leading_underscore: true
    convention: hyphenated_lowercase # or 'camel_case', or 'snake_case', or a regex pattern

  NestingDepth:
    enabled: true
    max_depth: 5

  PlaceholderInExtend:
    enabled: true

  PropertyCount:
    enabled: false
    include_nested: false
    max_properties: 10

  PropertyUnits:
    enabled: true
    global:
      [
        'ch', 'em', 'ex', 'rem',                 # Font-relative lengths
        'cm', 'in', 'mm', 'pc', 'pt', 'px', 'q', # Absolute lengths
        'vh', 'vw', 'vmin', 'vmax',              # Viewport-percentage lengths
        'deg', 'grad', 'rad', 'turn',            # Angle
        'ms', 's',                               # Duration
        'Hz', 'kHz',                             # Frequency
        'dpi', 'dpcm', 'dppx',                   # Resolution
        '%',                                     # Other
      ]
    properties: {}

  PropertySortOrder:
    enabled: true
    order: ["position", "top", "right", "bottom", "left", "z-index", "display", "visibility", "overflow", "overflow-x", "overflow-y", "float", "clear", "table-layout", "border-collapse", "empty-cells", "box-sizing", "width", "min-width", "max-width", "height", "min-height", "max-height", "margin", "margin-top", "margin-right", "margin-bottom", "margin-left", "padding", "padding-top", "padding-right", "padding-bottom", "padding-left", "border", "border-width", "border-style", "border-color", "border-radius", "border-top", "border-top-width", "border-top-style", "border-top-color", "border-right", "border-right-width", "border-right-style", "border-right-color", "border-bottom", "border-bottom-width", "border-bottom-style", "border-bottom-color", "border-left", "border-left-width", "border-left-style", "border-left-color", "border-top-left-radius", "border-top-right-radius", "border-bottom-right-radius", "border-bottom-left-radius", "white-space", "content", "background", "background-color", "background-image", "background-repeat", "background-attachment", "background-position", "background-size", "opacity", "color", "font", "font-family", "font-size", "font-weight", "font-style", "font-variant", "letter-spacing", "line-height", "list-style", "list-style-type", "list-style-position", "list-style-image", "outline", "outline-width", "outline-style", "outline-color", "text-align", "text-decoration", "text-indent", "text-transform", "text-shadow", "animation", "transform", "transition", "box-shadow", "cursor"]
    ignore_unspecified: false
    separate_groups: false

  PropertySpelling:
    enabled: true
    extra_properties: []

  QualifyingElement:
    enabled: true
    allow_element_with_attribute: false
    allow_element_with_class: false
    allow_element_with_id: false

  SelectorDepth:
    enabled: true
    max_depth: 5

  SelectorFormat:
    enabled: true
    convention: hyphenated_lowercase # or 'strict_BEM', or 'hyphenated_BEM', or 'snake_case', or 'camel_case', or a regex pattern

  Shorthand:
    enabled: true
    allowed_shorthands: [1, 2, 3]

  SingleLinePerProperty:
    enabled: true
    allow_single_line_rule_sets: true

  SingleLinePerSelector:
    enabled: true

  SpaceAfterComma:
    enabled: true

  SpaceAfterPropertyColon:
    enabled: true
    style: one_space # or 'no_space', or 'at_least_one_space', or 'aligned'

  SpaceAfterPropertyName:
    enabled: true

  SpaceBeforeBrace:
    enabled: true
    style: space # or 'new_line'
    allow_single_line_padding: false

  SpaceBetweenParens:
    enabled: true
    spaces: 0

  StringQuotes:
    enabled: true
    style: single_quotes # or double_quotes

  TrailingSemicolon:
    enabled: true

  TrailingZero:
    enabled: false

  UnnecessaryMantissa:
    enabled: true

  UnnecessaryParentReference:
    enabled: true

  UrlFormat:
    enabled: true

  UrlQuotes:
    enabled: true

  VariableForProperty:
    enabled: false
    properties: []

  VendorPrefix:
    enabled: true
    identifier_list: base
    additional_identifiers: []
    excluded_identifiers: []

  ZeroUnit:
    enabled: true

  Compass::*:
    enabled: false
```
