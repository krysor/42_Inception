#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html;
	wp core download --allow-root;
	wp config create --allow-root --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD}
	# wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD};
	# wp user create --allow-root ${WP_USER_LOGIN} --user_pass=${WP_USER_PASSWORD};

fi

exec /usr/sbin/php-fpm81 -F -R