# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/06 08:44:18 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/26 09:59:16 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update

RUN apt install -y lsb-release apt-transport-https ca-certificates curl wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt install -y php8.1 && apt install -y php8.1-fpm
RUN apt install -y php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-cli php8.1-dev php8.1-mbstring php8.1-zip php8.1-redis

COPY ./config/www.conf /etc/php/8.1/fpm/pool.d/www.conf
COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

RUN mkdir /var/www/html/inception && chmod 755 /var/www/html/inception
WORKDIR /var/www/html/inception

EXPOSE 9000

ENTRYPOINT ["bash", "/setup.sh" ]