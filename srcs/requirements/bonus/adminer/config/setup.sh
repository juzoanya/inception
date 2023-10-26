#!bin/bash

mkdir -p /var/www/html/inception/adminer
wget "http://www.adminer.org/latest.php" -O /var/www/html/inception/adminer/adminer.php 
chown -R www-data:www-data /var/www/html/inception/adminer/adminer.php 
chmod 755 /var/www/html/inception/adminer/adminer.php


cd /var/www/html/inception/adminer

rm index.html
touch index.php
chown -R index.php
chmod 755 index.php
echo "
<?php
header(\"Location: http://${DOMAIN_NAME}/adminer/adminer.php\", true, 301);
exit();
?>" | tee -a index.php

php -S 0.0.0.0:80