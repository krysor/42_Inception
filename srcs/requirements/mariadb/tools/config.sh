#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql

	if [ ! -f "tmp/init.sql" ]; then		
		echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
		echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_ROOT_PASSWORD';" >> /tmp/init.sql
		echo "CREATE DATABASE $DATABASE_NAME;" >> /tmp/init.sql
		echo "CREATE USER '$DATABASE_USER'@'%' IDENTIFIED by '$DATABASE_PASSWORD';"  >> /tmp/init.sql
		echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%';" >> /tmp/init.sql
		echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
	fi

 	mariadbd --user=mysql --bootstrap < /tmp/init.sql
fi

sed -i "s|skip-networking|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mariadbd --user=mysql #without exec the container wont stop immediately when docker down