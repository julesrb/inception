sleep 10

wp config create --allow-root \
                 --dbname=$SQL_DATABASE \
                 --dbuser=$SQL_USER \
                 --dbpass=$SQL_PASSWORD \
                 --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url=$DOMAIN \
                --title=inception \
                --admin_user=$WP_ADMIN \
                --admin_password=$WP_ADMIN_PW \
                --admin_email=info@example.com

wp user create $WP_USER2 $WP_USER2@example.com \
					--role=author

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

/usr/sbin/php-fpm7.3 -F