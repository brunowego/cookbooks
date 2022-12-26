# WordPress WP-Paginate

## Installation

```sh
wp plugin install wp-paginate --activate
```

## Snippet

```php
if ( function_exists( 'wp_paginate' ) ):
	wp_paginate();
	// wp_paginate( array( 'pages' => $num_pages, 'page' => $current_page ) );
	// wp_paginate( array( 'query' => $posts ) );
endif;
```

## Installation

```sh
wp plugin uninstall wp-paginate --deactivate
```
