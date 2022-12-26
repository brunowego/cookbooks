# WordPress WP-Paginate

## Installation

```sh
wp plugin install wp-pagenavi --activate
```

## Snippet

```php
if ( function_exists( 'wp_pagenavi' ) ):
	wp_pagenavi();
	// wp_pagenavi( array( 'query' => $posts ) );
endif;
```
