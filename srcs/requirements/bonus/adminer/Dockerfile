# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/23 13:57:06 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/23 17:00:46 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update

RUN apt install -y lsb-release apt-transport-https ca-certificates curl wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt install -y php8.1 php8.1-mysql

COPY ./config/setup.sh /setup.sh

EXPOSE 9000

RUN chmod +x /setup.sh

CMD [ "/setup.sh" ]