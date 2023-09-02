#!/bin/sh

if [ ! -f /var/www/html/index.php ]; then
	sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php81/php-fpm.d/www.conf
	wp-cli.phar core download --path=/var/www/html
	wp-cli.phar config create --path=/var/www/html --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS
	wp-cli.phar core install --path=/var/www/html --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_email=$WP_ADMIN_EMAIL --admin_password=$WP_ADMIN_PASS --skip-email
	wp-cli.phar user create --path=/var/www/html $WP_USER $WP_EMAIL --user_pass=$WP_PASS
fi

php-fpm81 -F
