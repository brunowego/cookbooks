# WordPress Breadcrumb NavXT

## Installation

```sh
wp plugin install breadcrumb-navxt --activate
```

## Snippet

```php
<?php if ( ! is_home() ) : ?>
    <?php if ( function_exists('bcn_display') ) : ?>
        <?php bcn_display(); ?>
    <?php endif; ?>
<?php endif; ?>
```
