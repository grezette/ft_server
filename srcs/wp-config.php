<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpressuser' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '/K:{wTJlM4Q8chmLM,Q,m`5vr|A0W]^/&v3`{:vSb~@azpxu E3oA5{tc&FY-{18');
define('SECURE_AUTH_KEY',  '+/X+Q[Dw=[X7xq4jZt#6PW;+..~?J!(ZFw~OI-yJ;g!IHzq:OjRW-0kwKy@DCV[P');
define('LOGGED_IN_KEY',    '/y,]l~ZeVQ2]<[9YsE|-hOBT0@99/kzv?nTJyq~,iLO%|XAOb+Sji9%P.e]S{H(R');
define('NONCE_KEY',        '~D+[Q)(dFCl+iIR^`/r@:m(T6nBuN]G +(S A63z[9bYp2Wc|;6l]61RYx_1$>W{');
define('AUTH_SALT',        'N4`O!vYty}adL~74AjBb-nE_h~c;dZ+gHc-=0gI&%Q~_*Sd.6|YUCLwp;]&|h1>.');
define('SECURE_AUTH_SALT', 'oX3Lxa6H|`mb-/$V>=/,:d%73^?3W7UPmCBb&n!tIR![S&W|*|O>Ksk|[+)]Q.kL');
define('LOGGED_IN_SALT',   'Y(o|#|3uw#SO@Lu=j9NaIjwX;;-+aW{*`LVmDvAn>+AQ_HLgf ]/%3tjUV[Iy_i0');
define('NONCE_SALT',       '];)=i6Hp^/VZNgTaz|bL5qPBD3 )0r!}Yf3VNElSyaZY}MR-lm0+*P#&>BwL=}Iy');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
