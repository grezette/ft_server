#start mysql
service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'enter-password-here';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "EXIT" | mysql -u root

#start word press
mkdir /var/www/localhost/wordpress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz -C /var/www/localhost/wordpress

chown -R www-data:www-data /var/www/* && \
chmod -R 755 /var/www/*

service mysql restart
service php7.3-fpm start
service nginx restart
sleep infinity && wait
