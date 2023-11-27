FROM debian:12.2

#dependency
RUN	apt-get update -y
RUN	apt-get install -y php-fpm
RUN	apt-get install -y php-mysql
RUN	apt-get install -y mariadb-client
RUN	apt-get install -y wget && apt-get install -y unzip

#getting wordpress

WORKDIR /var/www/html/
RUN	wget https://wordpress.org/wordpress-6.4.1.zip
RUN	unzip wordpress-6.4.1.zip
RUN	mv wordpress/* .
RUN	chown -R root:root /var/www/html/
RUN	chmod 777 /var/www/html/
RUN	rm -rf wordpress-6.4.1.zip

#setting up php-fpm
RUN	rm -f /etc/php/8.2/fpm/pool.d/www.conf
COPY	www.conf /etc/php/8.2/fpm/pool.d
RUN	chown -R www-data:www-data /etc/php/8.2/fpm/pool.d/
RUN	chmod 655 /etc/php/8.2/fpm/pool.d/www.conf

#getting wp-cli to setup wordpress with scripts
RUN	wget https://github.com/wp-cli/wp-cli/releases/download/v2.9.0/wp-cli-2.9.0.phar
RUN	chmod +x wp-cli-2.9.0.phar
RUN	mv wp-cli-2.9.0.phar /usr/local/bin/wp
COPY	wp_init.sh /tmp/wp_init.sh
RUN	chmod +x /tmp/wp_init.sh

WORKDIR /var/www/html/
EXPOSE	9000
ENTRYPOINT ["sh","/tmp/wp_init.sh"]
