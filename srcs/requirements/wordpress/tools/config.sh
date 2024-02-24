#!/bin/sh

while ! mariadb -hmariadb -u$DATABASE_USER -p$DATABASE_PASSWORD $DATABASE_NAME &>/dev/null; do
    sleep 1
done

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html;
	wp core download --allow-root;
	wp config create --allow-root --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_PASSWORD} --dbhost=mariadb
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};
	wp user create $WP_USER_LOGIN $WP_USER_EMAIL --role=author --user_pass=${WP_USER_PASSWORD} --allow-root;
fi

exec /usr/sbin/php-fpm81 -F -R
