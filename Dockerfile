# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: grezette <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/04 18:34:11 by grezette          #+#    #+#              #
#    Updated: 2020/01/05 18:51:53 by grezette         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN  apt-get update && \
	 apt-get install -y nginx && \
	 apt-get install -y php-mysql && \
	 apt install -y mariadb-server mariadb-client && \
	 apt install -y wget && \
	 apt-get install -y php-mbstring php-fpm  php-gd

RUN rm -rf /etc/nginx/sites-available/default

RUN mkdir -p /var/www/localhost/phpmyadmin

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-english.tar.gz && \
	tar xvf phpMyAdmin-5.0.0-english.tar.gz -C /var/www/localhost/phpmyadmin


#start mysql
#RUN	service mysql start
#RUN	mysql -u root -p=password
#RUN	CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
#RUN GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'enter-password-here';
#RUN	FLUSH PRIVILEGES;
#RUN EXIT;

#start word press
#RUN mkdir /var/www/localhost/wordpress
#RUN cd /tmp
#RUN wget https://wordpress.org/latest.tar.gz
#RUN tar xzvf latest.tar.gz -C /var/www/localhost/wordpress

ADD	./srcs/default /etc/nginx/sites-available
ADD ./srcs/nginx-selfsigned.crt /etc/ssl/certs
ADD ./srcs/nginx-selfsigned.key /etc/ssl/private
ADD ./srcs/wp-config.php /var/www/localhost
ADD  ./srcs/start.sh /

#RUN chown -R www-data:www-data /var/www/* && \
#	chmod -R 755 /var/www/*

#RUN service mysql restart
#RUN	service nginx restart

EXPOSE 80

CMD bash start.sh
