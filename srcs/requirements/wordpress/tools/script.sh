#!/bin/sh

if [ ! -f /var/www/html/wordpress/index.php ]; then
	wp-cli.phar core download --path=/var/www/html/wordpress
	wp-cli.phar config create --path=/var/www/html/wordpress --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS
	wp-cli.phar core install --path=/var/www/html/wordpress --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_email=$WP_ADMIN_EMAIL --admin_password=$WP_ADMIN_PASS --skip-email
	wp-cli.phar user create --path=/var/www/html/wordpress $WP_USER $WP_EMAIL --user_pass=$WP_PASS

	wp-cli.phar config set --path=/var/www/html/wordpress --add WP_CACHE true --raw
	wp-cli.phar config set --path=/var/www/html/wordpress --add WP_REDIS_HOST redis
	wp-cli.phar plugin install --path=/var/www/html/wordpress redis-cache --activate
	wp-cli.phar redis --path=/var/www/html/wordpress enable
fi

php-fpm81 -F
