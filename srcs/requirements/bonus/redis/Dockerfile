# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/22 15:16:24 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/22 15:35:21 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server

RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

RUN echo "maxmemory 256mb" | tee -a /etc/redis/redis.conf

RUN echo "maxmemory-policy allkeys-lru" | tee -a /etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server", "--protected-mode", "no" ]