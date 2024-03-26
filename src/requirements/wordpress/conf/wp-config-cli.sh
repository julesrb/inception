sleep 12
set -a
source .env
set +a
echo "--------"
cd var/

wp config create --allow-root \
                 --dbname=$SQL_DATABASE \
                 --dbuser=$SQL_USER \
                 --dbpass=$SQL_PASSWORD \
                 --dbhost=mariadb:3306 \
                 --path='/var/www/wordpress'
echo "--------"
wp core install --allow-root \
                --url=$DOMAIN \
                --title=inception \
                --admin_user=$WP_ADMIN \
                --admin_password=$WP_ADMIN_PW \
                --admin_email=info@example.com \
                --path='/var/www/wordpress'
echo "--------"
wp user create --allow-root $WP_USER2 $WP_USER2@example.com \
					--role=author \
                    --path='/var/www/wordpress'
echo "--------"
if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

/usr/sbin/php-fpm7.3 -F