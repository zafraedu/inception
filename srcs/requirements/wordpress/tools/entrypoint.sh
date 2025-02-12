#!/bin/bash

# Crear el directorio para WordPress si no existe
mkdir -p /var/www/html

# Limpiar el directorio de WordPress (en caso de que ya haya algo)
rm -rf /var/www/html/*

#Download wordpress and all config file
cd /var/www/html
wp core download --allow-root
#Inport env variables in the config file
sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
sed -i "s/password_here/$DB_PWD/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php
# uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

fi
exec "$@"
