# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: grezette <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/08 15:03:44 by grezette          #+#    #+#              #
#    Updated: 2020/01/12 19:18:38 by grezette         ###   ########.fr        #
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
	apt-get install -y mariadb-server-10.3

RUN	apt-get install -y vim

#init phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/html/phpmyadmin

#init nginx
RUN chown www-data:www-data /usr/share/nginx/html/ -R

COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/ssl-cert-snakeoil.pem /etc/ssl/certs/
COPY ./srcs/ssl-cert-snakeoil.key /etc/ssl/private/

EXPOSE 80
