# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/06 13:28:01 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/26 09:58:05 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server


COPY tools/setup.sh /

COPY config/50-server.cnf /etc/mysql/mariadb.conf.d 

EXPOSE 3306

ENTRYPOINT [ "bash", "/setup.sh" ]