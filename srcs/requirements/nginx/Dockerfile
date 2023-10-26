# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/26 02:12:46 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/26 09:58:22 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/juzoanya.42.fr.key \
	-out /etc/ssl/certs/juzoanya.42.fr.crt \
	-subj '/CN=juzoanya.42.fr'

COPY ./config/default /default
COPY ./tools/setup.sh /setup.sh

RUN mkdir /var/www/html/inception && chmod 755 /var/www/html/inception

EXPOSE 443

ENTRYPOINT [ "bash", "/setup.sh" ]
