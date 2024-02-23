#!/bin/sh

while ! mariadb -hmariadb -u$MARIADB_USER -p$MARIADB_PASSWORD $MARIADB_NAME; do
    sleep 3
done

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html;
	wp core download --allow-root;
	wp config create --allow-root --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};
	wp user create $WP_USER_LOGIN $WP_USER_EMAIL --role=author --user_pass=${WP_USER_PASSWORD} --allow-root;

fi

exec /usr/sbin/php-fpm81 -F -R