#!/bin/bash

if [-f ./wp-config.php]
then
	echo "Wordpress already downloaded.";
else
	rm -rf *
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root

	cp wp-config-sample.php wp-config.php
	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
	sed -i "s/localhost/$MYSQL_DB_HOST/g" wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php

	wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
	sleep 5
	wp user create ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
	
	wp theme install twentytwentythree --activate --allow-root

	#BONUS PART -- integration to WP####################################
	wp config set WP_CACHE 'true' --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
  	wp config set WP_REDIS_PORT 6379 --raw --allow-root
 	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
 	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp config set WP_REDIS_PREFIX $DOMAIN_NAME --allow-root
	wp config set WP_REDIS_DATABASE 0 --allow-root
	wp config set WP_REDIS_TIMEOUT 1 --allow-root
	wp config set WP_REDIS_READ_TIMEOUT 1 --allow-root
	wp plugin install redis-cache --activate --allow-root 
	######################################################################

	wp plugin update --all --allow-root
	
	sed -i 's/listen = \/run\/php\/php8.1-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/8.1/fpm/pool.d/www.conf
	mkdir /run/php

	wp redis enable --allow-root #BONUS

fi

/usr/sbin/php-fpm8.1 -F