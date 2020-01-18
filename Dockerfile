# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: grezette <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/08 15:03:44 by grezette          #+#    #+#              #
#    Updated: 2020/01/18 14:29:26 by grezette         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get install -y wget && \
	apt-get install -y nginx && \
	apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline && \
	apt-get install -y openssl && \
	apt-get install -y php-mbstring php-zip php-gd && \
	apt-get install -y php-mysql && \
	apt-get install -y default-mysql-server

#init phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/html/phpmyadmin

#init wordpress
RUN wget https://wordpress.org/latest.tar.gz && \
	tar xzvf latest.tar.gz && \
	cp -a wordpress/. /var/www/html/wordpress

#init nginx
RUN chown www-data:www-data /usr/share/nginx/html/ -R

COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/ssl-cert-snakeoil.pem /etc/ssl/certs/
COPY ./srcs/ssl-cert-snakeoil.key /etc/ssl/private/
COPY ./srcs/wp-config.php /var/www/html/wordpress/
COPY ./srcs/init.sh /tmp

EXPOSE 80
EXPOSE 443

CMD bash /tmp/init.sh
