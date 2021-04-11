# WordPress Template Functions

<!--
https://njengah.com/disable-comments-custom-post-type/
-->

## Remove Transient Updates

```php
/**
 *
 */
function mytheme_remove_transient_updates() {
	global $wp_version;

	return ( object ) array( 'last_checked' => time(), 'version_checked' => $wp_version );
}
add_filter( 'pre_site_transient_update_core', 'mytheme_remove_transient_updates' );
add_filter( 'pre_site_transient_update_plugins', 'mytheme_remove_transient_updates' );
add_filter( 'pre_site_transient_update_themes', 'mytheme_remove_transient_updates' );
```
