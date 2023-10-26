#bash

cp /default /etc/nginx/sites-available/juzoanya.42.fr

ln -s /etc/nginx/sites-available/juzoanya.42.fr /etc/nginx/sites-enabled/juzoanya.42.fr
rm /default /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
echo "127.0.0.1       juzoanya.42.fr" | tee -a /etc/hosts

nginx -g "daemon off;"