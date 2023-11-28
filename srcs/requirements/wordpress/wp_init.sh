sleep 10;
cd /var/www/html/ && wp config create --allow-root --dbname=$DATABASE --dbuser=$USER --dbpass=$PASSWORD --dbhost=mariadb:3306 --path='/var/www/html'

cd /var/www/html/ && wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$MAIL --skip-email

wp theme activate twentytwentyfour --allow-root

exec php-fpm8.2 -F
